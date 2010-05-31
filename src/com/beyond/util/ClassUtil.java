package com.beyond.util;

import java.lang.reflect.Method;

public class ClassUtil {

	public static Object getValue(Object obj, String methodName) throws Exception{
		Class<?> c = obj.getClass();
		Method method = c.getMethod(methodName);
		return method.invoke(c);
	}
}
