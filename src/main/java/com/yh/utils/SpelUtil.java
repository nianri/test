package com.yh.utils;

import java.util.Map;

import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.ParserContext;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.util.Assert;

import com.yh.model.FeedbackInfo;

/**
 * spel工具类
 * @author wangxu
 *
 */
public class SpelUtil {
	private StandardEvaluationContext context =new StandardEvaluationContext(); 
	private ExpressionParser parser = new SpelExpressionParser();  
	private ParserContext templateContext=new TemplateParserContext();
	
	
	public static SpelUtil newInstance(){
		return new SpelUtil();
	}
	
	public SpelUtil setParserContext(ParserContext parserContext){
		Assert.notNull(parserContext,"  parserContext can not be null ");
		this.templateContext=parserContext;
		return this;
	}
	
	public SpelUtil setParserContext(String expressionPrefix,String expressionSuffix){
		Assert.hasText(expressionPrefix, "  expressionPrefix must has text ");
		Assert.hasText(expressionSuffix, "  expressionSuffix must has text ");
		
		templateContext=new ParserContext(){
			@Override
			public boolean isTemplate() {
				return true;
			}

			@Override
			public String getExpressionPrefix() {
				return expressionPrefix;
			}

			@Override
			public String getExpressionSuffix() {
				return expressionSuffix;
			}
		};
		return this;
	}
	
	
	private Expression parseExpression(String expression){
		return this.parser.parseExpression(expression);
	}
	
	private Expression parseTemplate(String template){
		return this.parser.parseExpression(template, templateContext);
	}
	
	public SpelUtil setRootObject(Object root){
		context.setRootObject(root);
		return this;
	}
	
	public SpelUtil addVariable(String name,Object variable){
		context.setVariable(name, variable);
		return this;
	}
	
	public SpelUtil addVariable(Map<String,Object>map){
		context.setVariables(map);
		return this;
	}
	
	public Object getExpressionValue(String expression){
		Expression exp=this.parseExpression(expression);
		return exp.getValue(context);
	}
	
	public <T> T getExpressionValue(String expression,Class<T>clazz){
		Expression exp=this.parseExpression(expression);
		return exp.getValue(context, clazz);
	}
	
	public  Object getTemplateValue(String template){
		Expression exp=this.parseTemplate(template);
		return exp.getValue(context);
	}
	
	public <T> T getTemplateValue(String template,Class<T>clazz){
		Expression exp=this.parseTemplate(template);
		return exp.getValue(context, clazz);
	}
	
	public String getExpressionPrefix(){
		return this.templateContext.getExpressionPrefix();
	}
	
	public static void main(String args[]){
		SpelUtil spelUtil=new SpelUtil();
		
		FeedbackInfo feedbackInfo=new FeedbackInfo();
		feedbackInfo.setFeedbackid("----------");
//		goodsInfoParam.setGoodsLabels(Lists.newArrayList());
		spelUtil.setRootObject(feedbackInfo);
		spelUtil.addVariable("message", feedbackInfo);
//		System.out.println(spelUtil.getExpressionValue("#message.feedbackid"));
	    System.out.println( spelUtil.getTemplateValue("#{feedbackid}",String.class));
	}
	
}
