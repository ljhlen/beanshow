package com.ljh.aoplog;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import java.util.Arrays;

/**
 * 通过注解实现增强
 * 
 * @author ljh
 *
 */
@Aspect
public class Loggers {
	private static final Logger log = Logger.getLogger(Loggers.class);

	@Before("execution(* com.ljh.*.service.*.*(..))||execution(* com.ljh.*.dao.*.*(..))")
	public void before(JoinPoint jp) {
		log.info(
				"调用" + jp.getTarget() + "的" + jp.getSignature().getName() + "方法。方法入参：" + Arrays.toString(jp.getArgs()));
	}

	@AfterReturning(pointcut = "execution(* com.ljh.*.service.*.*(..))||execution(* com.ljh.*.dao.*.*(..))", returning = "returnValue")
	public void afterReturning(JoinPoint jp, Object returnValue) {
		log.info("调用" + jp.getTarget() + "的" + jp.getSignature().getName() + "方法。方法返回值：" + returnValue);
	}

	/**
	 * 通过注解实现异常抛出增强
	 * 
	 * @param jp
	 * @param e
	 */
	@AfterThrowing(pointcut = "execution(* com.ljh.*.*.*.*(..))", throwing = "e")
	public void afterThrowing(JoinPoint jp, RuntimeException e) {
		log.info(jp.getSignature().getName() + " 方法发生异常：" + e);
	}
}
