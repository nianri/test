package com.yh.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel工具
 * @author wangxu
 *
 */
public class ExcelUtil {
	/**
	 * 获取workbook
	 * @param templatePath
	 * @return
	 */
	
	@SuppressWarnings("unused")
	public static  XSSFWorkbook getWorkbook(String templatePath)throws IOException{
		XSSFWorkbook wb = new XSSFWorkbook(templatePath);
		return wb;
	}
	
	public static XSSFWorkbook getWorkbook(InputStream inputStream) throws IOException{
		XSSFWorkbook wb=new XSSFWorkbook(inputStream);
		return wb;
	}
	public static  XSSFSheet getSheet(XSSFWorkbook workbook,int sheetIndex){
		return workbook.getSheetAt(sheetIndex);
	}
	
	public static XSSFSheet cloneSheet(XSSFWorkbook workbook,int original){
		return workbook.cloneSheet(original);
	}
	
	public static XSSFSheet cloneSheet(XSSFWorkbook workbook,int original,String newName){
		return workbook.cloneSheet(original, newName);
	}
	
	public static  void copyRow(XSSFWorkbook wb, XSSFRow fromRow, XSSFRow toRow, boolean copyValueFlag) {
		toRow.setHeight(fromRow.getHeight());
		for (Iterator<?> cellIt = fromRow.cellIterator(); cellIt.hasNext();) {
			XSSFCell tmpCell = (XSSFCell) cellIt.next();
			XSSFCell newCell = toRow.createCell(tmpCell.getColumnIndex());
			copyCell(wb, tmpCell, newCell, copyValueFlag);
		}
		XSSFSheet worksheet = fromRow.getSheet();
		for (int i = 0; i < worksheet.getNumMergedRegions(); i++) {
			org.apache.poi.ss.util.CellRangeAddress cellRangeAddress = worksheet.getMergedRegion(i);
			if (cellRangeAddress.getFirstRow() == fromRow.getRowNum()) {
				CellRangeAddress newCellRangeAddress = new CellRangeAddress(toRow.getRowNum(),
						(toRow.getRowNum() + (cellRangeAddress.getLastRow() - cellRangeAddress.getFirstRow())),
						cellRangeAddress.getFirstColumn(), cellRangeAddress.getLastColumn());
				worksheet.addMergedRegion(newCellRangeAddress);
			}
		}
	}
	
	public static void copyCell(XSSFWorkbook wb, XSSFCell srcCell, XSSFCell distCell, boolean copyValueFlag) {
		// 样式
		distCell.setCellStyle(srcCell.getCellStyle());
		// 评论
		if (srcCell.getCellComment() != null) {
			distCell.setCellComment(srcCell.getCellComment());
		}
		// 不同数据类型处理
		int srcCellType = srcCell.getCellType();
		distCell.setCellType(srcCellType);
		if (copyValueFlag) {
			if (srcCellType == HSSFCell.CELL_TYPE_NUMERIC) {
				if (HSSFDateUtil.isCellDateFormatted(srcCell)) {
					distCell.setCellValue(srcCell.getDateCellValue());
				} else {
					distCell.setCellValue(srcCell.getNumericCellValue());
				}
			} else if (srcCellType == HSSFCell.CELL_TYPE_STRING) {
				distCell.setCellValue(srcCell.getRichStringCellValue());
			} else if (srcCellType == HSSFCell.CELL_TYPE_BLANK) {
				// nothing21
			} else if (srcCellType == HSSFCell.CELL_TYPE_BOOLEAN) {
				distCell.setCellValue(srcCell.getBooleanCellValue());
			} else if (srcCellType == HSSFCell.CELL_TYPE_ERROR) {
				distCell.setCellErrorValue(srcCell.getErrorCellValue());
			} else if (srcCellType == HSSFCell.CELL_TYPE_FORMULA) {
				distCell.setCellFormula(srcCell.getCellFormula());
			} else { // nothing29
			}
		}
	}
	
	public static int getLastRow(XSSFSheet sheet){
		return sheet.getLastRowNum();
	}
	
	public static XSSFRow getRow(XSSFSheet sheet,int rowNum){
		return sheet.getRow(rowNum);
	}
	
	public static XSSFCell getCell(XSSFRow row,int cellNum){
		return row.getCell(cellNum);
	}
	
	public static XSSFRow creatRow(XSSFSheet sheet,int rowNum){
		return sheet.createRow(rowNum);
	}

    public static void deleteSheet(XSSFWorkbook workbook,int index){
    	workbook.removeSheetAt(index);
    }
    
    public static void deleteRow(XSSFSheet sheet,int index){
    	sheet.removeRow(sheet.getRow(index));
    }
	
	public static void main(String args[]){
		try {
			XSSFWorkbook book=ExcelUtil.getWorkbook("d://channelList.xlsx");
			ExcelUtil.cloneSheet(book, 0, "2");
			XSSFSheet sheet=book.getSheetAt(0);
			sheet.createRow(10).createCell(10).setCellValue("asdfdsafd");
			FileOutputStream out=new FileOutputStream("d://channelList1.xlsx");
			book.write(out);
			 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
