package com.yh.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.StringUtils;
/**
 * sheet 0 不用做填充数据，只用作模板
 * 数据从sheet 1开始填充
 * 处理完之后需要把sheet 0 删掉
 * excel导出工具
 */
public class ExcelExportUtil{
	private static Logger logger=LoggerFactory.getLogger(ExcelExportUtil.class);
	private static final int   ONE_SHEET_ROW_COUNT=1048576;//一个sheet页最多行数
	private SpelUtil spelUtil=SpelUtil.newInstance();//spel表达式工具
	private XSSFWorkbook workbook;//工作薄
	private int totalSheet;//总的sheet页数量      包括sheet 0   模板sheet
	private int dataBeginRow;//模板中的数据开始行，现在的规则是模板中如果一行的第一个单元格式以#{开头，则是数据开始行
	private int nowFillSheet=1;//当前填充的sheet页
	private int nowFillRow;//当前填充数据的行
	public ExcelExportUtil(String templatePath) throws IOException{
		ResourceLoader resourceLoader=new DefaultResourceLoader(this.getClass().getClassLoader());
		this.workbook=ExcelUtil.getWorkbook(resourceLoader.getResource(templatePath).getInputStream());
	}
	
	/**
	 * 初始化 workbook 
	 * 1.确定数据开始行
	 * 2.计算总的sheet页
	 *   2.1.先按照数据总量计算出需要的sheet页数
	 *   2.2.然后clone sheet页模板
	 * @param totalDataCount 
	 */
	public void init(int totalDataCount){
		initDataBeginRow();
		if(totalDataCount<=ExcelExportUtil.ONE_SHEET_ROW_COUNT){
			this.totalSheet=2;
			this.cloneTemplateSheet();
		}else{
			//计算总需要的sheet页数
			//1.计算余数
			int temp=totalDataCount%ExcelExportUtil.ONE_SHEET_ROW_COUNT;
			//2.如果余数不是0,则总sheet页为商+1
			int totalSheetCount=totalDataCount/ExcelExportUtil.ONE_SHEET_ROW_COUNT+(temp==0?0:1);
			this.totalSheet=totalSheetCount+1;
			//3.clone sheet页模板，使得所有的sheet页都和第一个sheet页模板内容相同
			for(int i=0;i<totalSheetCount;i++){
				 this.cloneTemplateSheet();
			}
		}
	}
	
	//获取模板中数据的开始行
	private void initDataBeginRow(){
		XSSFSheet sheet=ExcelUtil.getSheet(this.workbook, 0);
		int lastRowNum=ExcelUtil.getLastRow(sheet);
		System.out.println(lastRowNum);
		for(int i=0;i<=lastRowNum;i++){
			XSSFRow row=ExcelUtil.getRow(sheet, i);
			if(row!=null){
				XSSFCell cell=ExcelUtil.getCell(row, 0);
				if(cell!=null){
					String value= cell.getStringCellValue();
					if(!StringUtils.isEmpty(value)){
						if(value.startsWith(spelUtil.getExpressionPrefix())){
							this.dataBeginRow=i;
							this.nowFillRow=this.dataBeginRow;
							break;
						}
					}
				}
			}
		}
	}
	
	/**
	 * 填充数据
	 * @param data 数据列表
	 */
	public void fillData(List<?> data){
		if(data==null||data.isEmpty()){
			return ;
		}else{
			for(Object e:data){
				if(e!=null){
					renderOneRow(e);
				}
			}
		}
	}
	
	private void renderOneRow(Object data){
		//已经到了一个sheet页面的最大行，赋值之后需要切换到下一个sheet页,nowFillRow需要重新赋值为dataBeginRow
		if(this.nowFillRow==ONE_SHEET_ROW_COUNT-1){
			doRender(data);
			if(this.nowFillSheet==this.totalSheet-1){
				this.cloneTemplateSheet();
				this.totalSheet++;
				this.nowFillSheet++;
				this.nowFillRow=this.dataBeginRow;
			}else{
				this.nowFillSheet++;
				this.nowFillRow=this.dataBeginRow;
			}
		}
		//还没有到最大行，需要先copy本行模板到下一行，然后再赋值
		else{
			copyRow(this.nowFillRow+1);
			doRender(data);
			this.nowFillRow++;
		}
	}
	
	/**
	 * 赋值
	 * @param data
	 */
	private void doRender(Object data){
		this.spelUtil.setRootObject(data);
		XSSFRow row=this.getNowRow();
		int totalCellNum=row.getLastCellNum();
		for(int i=0;i<totalCellNum;i++){
			XSSFCell cell=ExcelUtil.getCell(row, i);
			renderCell(cell);
		}
	}
	
	private void renderCell(XSSFCell cell){
		if(cell!=null){
			//是否需要判断cellType?
			String cellValue=cell.getStringCellValue();
			if(!StringUtils.isEmpty(cellValue)){
				cellValue=spelUtil.getTemplateValue(cellValue, String.class);
				cell.setCellValue(cellValue);
			}
		}
	}
	
	private XSSFSheet getNowSheet(){
		XSSFSheet sheet=ExcelUtil.getSheet(this.workbook, this.nowFillSheet);
		return sheet;
	}
	
	private XSSFRow getNowRow(){
		XSSFRow row=ExcelUtil.getRow(this.getNowSheet(), this.nowFillRow);
		return row;
	}
	
	private void copyRow(int nextRow){
		XSSFSheet sheet=this.getNowSheet();
		XSSFRow row=ExcelUtil.creatRow(sheet, nextRow);
		ExcelUtil.copyRow(workbook, ExcelUtil.getRow(sheet, this.nowFillRow), row, true);
	}
	
	private void cloneTemplateSheet(){
		ExcelUtil.cloneSheet(this.workbook, 0);
	}
	
	
	/**
	 * 导出
	 * @return
	 * @throws IOException 
	 */
	public byte[] exportData() throws IOException{
		clearTemplate();
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		this.workbook.write(out);
		return out.toByteArray();
	}
	
	/**
	 * 清理模板
	 */
	private void clearTemplate(){
		//到了最后一个sheet页
		if(this.nowFillSheet==this.totalSheet-1){
			
		}
		//还没有到最后一个sheet页
		else{
			for(int i=this.totalSheet-1;i>this.nowFillSheet;i--){
				ExcelUtil.deleteSheet(this.workbook, i);
			}
			
		}
		 //如果当前sheet没有填充数据，并且当前sheet不等于1  直接删掉
		if((this.dataBeginRow==this.nowFillRow)&&(this.nowFillSheet!=1)){
			ExcelUtil.deleteSheet(this.workbook, this.nowFillSheet);
		}
		//否则删掉最后一行，因为最后一行是模板内容
		else{
			ExcelUtil.deleteRow(this.getNowSheet(), this.nowFillRow);
		}
		//删除 sheet 0
		ExcelUtil.deleteSheet(this.workbook, 0);
	}
	
	public static void main(String args[]) throws IOException, OpenXML4JException{
		ExcelExportUtil u=new ExcelExportUtil("用户列表.xlsx");
		u.init(10000000);
		byte b[]=u.exportData();
		FileOutputStream fileOutputStream=new FileOutputStream("d://u.xlsx");
		fileOutputStream.write(b);
		fileOutputStream.close();
		System.out.println(u.totalSheet);
		System.out.println(u.dataBeginRow);
	}
}





