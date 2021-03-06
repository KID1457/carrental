package com.cuc.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class ArrayHelper {

	private ArrayHelper() {
	}

	public static int sizeOf(int[] arr) {
		return arr == null ? 0 : arr.length;
	}

	public static int[] merge(int[]... arrs) {
		int[] result = new int[0];
		if (arrs != null) {
			int count = 0;
			for (int i = 0; i < arrs.length; i++) {
				count += arrs[i].length;
			}
			result = new int[count];
			int arg;
			int k = 0;
			for (int i = 0; i < arrs.length; i++) {
				if (arrs[i] == null) {
					continue;
				}
				for (int j = 0; j < arrs[i].length; j++) {
					arg = arrs[i][j];
					result[k] = arg;
					k++;
				}
			}
		}
		return result;
	}

	public static int[] diff(int[] aArr, int[] bArr) {
		{
			if (aArr == null) {
				return bArr;
			}
			if (bArr == null) {
				return aArr;
			}
		}
		int[] cArr = new int[aArr.length + bArr.length];
		int idx = 0;
		for (int i = 0; i < aArr.length; i++) {
			if (!inArray(bArr, aArr[i])) {
				cArr[idx++] = aArr[i];
			}
		}
		for (int i = 0; i < bArr.length; i++) {
			if (!inArray(aArr, bArr[i])) {
				cArr[idx++] = bArr[i];
			}
		}
		int[] dArr = new int[idx];
		System.arraycopy(cArr, 0, dArr, 0, dArr.length);
		return dArr;
	}

	public static int[] copyOf(int[] arr) {
		int[] carr = new int[0];
		if (arr != null) {
			carr = new int[arr.length];
			System.arraycopy(arr, 0, carr, 0, arr.length);
		}
		return carr;
	}

	public static int[] copyOf(int[] arr, int i) {
		int[] carr = new int[0];
		if (arr != null) {
			if (i > arr.length) {
				i = arr.length;
			}
			carr = new int[i];
			System.arraycopy(arr, 0, carr, 0, i);
		}
		return carr;
	}

	public static <T, V> Map<T, V> combine(T[] keys, V[] values) {
		Map<T, V> map = new HashMap<T, V>();
		if (keys != null && keys.length > 0) {
			int vsize = values == null ? 0 : values.length;
			for (int i = 0; i < keys.length; i++) {
				if (i >= vsize) {
					map.put(keys[i], null);
				} else {
					map.put(keys[i], values[i]);
				}
			}
		}
		return map;
	}

	public static int[] random(int[] arr) {
		if (arr == null) {
			return new int[0];
		}
		int count = new Random().nextInt(arr.length);
		count = count > 0 ? count : 1;
		return random(arr, count);
	}

	public static int[] shuffle(int[] arr) {
		if (arr == null) {
			return new int[0];
		}
		return random(arr, arr.length);
	}

	public static int[] random(int[] arr, int count) {
		int[] rarr = new int[0];
		if (arr != null) {
			if (arr.length < count) {
				count = arr.length;
			}
			Random random = new Random();
			int i = 0;
			int num = 0;
			rarr = new int[count];
			int[] keys = new int[count];
			for (int j = 0; j < keys.length; j++) {
				keys[j] = -1;
			}
			do {
				num = random.nextInt(arr.length);
				if (!inArray(keys, num)) {
					keys[i] = num;
					rarr[i] = arr[num];
					i++;
				}
			} while (i < count);
		}
		return rarr;
	}

	public static boolean inArray(int[] arr, int search) {
		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				if (arr[i] == search) {
					return true;
				}
			}
		}
		return false;
	}

	public static boolean inArray(int[] arr, int[] search) {
		if (search != null) {
			for (int i = 0; i < search.length; i++) {
				if (!inArray(arr, search[i])) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	public static int search(int[] arr, int search) {
		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				if (arr[i] == search) {
					return i;
				}
			}
		}
		return -1;
	}

	public static int[] reverse(int[] arr) {
		int[] rarr = new int[0];
		if (arr != null) {
			rarr = new int[arr.length];
			int j = 0;
			for (int i = arr.length - 1; i >= 0; i--) {
				rarr[j++] = arr[i];
			}
		}
		return rarr;
	}

	public static String join(int[] ints, String sep) {
		StringBuilder strBuilder = new StringBuilder();
		if (ints != null) {
			for (int i = 0; i < ints.length; i++) {
				strBuilder.append(ints[i]);
				if (i < ints.length - 1) {
					strBuilder.append(sep);
				}
			}
		}
		return strBuilder.toString();
	}

	public static int sum(int[] ints) {
		int sum = 0;
		if (ints != null) {
			for (int i = 0; i < ints.length; i++) {
				sum += ints[i];
			}
		}
		return sum;
	}

	public static int sizeOf(char[] arr) {
		return arr == null ? 0 : arr.length;
	}

	public static char[] merge(char[]... arrs) {
		char[] result = new char[0];
		if (arrs != null) {
			char count = 0;
			for (char i = 0; i < arrs.length; i++) {
				count += arrs[i].length;
			}
			result = new char[count];
			char arg;
			char k = 0;
			for (char i = 0; i < arrs.length; i++) {
				if (arrs[i] == null) {
					continue;
				}
				for (char j = 0; j < arrs[i].length; j++) {
					arg = arrs[i][j];
					result[k] = arg;
					k++;
				}
			}
		}
		return result;
	}

	public static char[] diff(char[] aArr, char[] bArr) {
		{
			if (aArr == null) {
				return bArr;
			}
			if (bArr == null) {
				return aArr;
			}
		}
		char[] cArr = new char[aArr.length + bArr.length];
		char idx = 0;
		for (int i = 0; i < aArr.length; i++) {
			if (!inArray(bArr, aArr[i])) {
				cArr[idx++] = aArr[i];
			}
		}
		for (int i = 0; i < bArr.length; i++) {
			if (!inArray(aArr, bArr[i])) {
				cArr[idx++] = bArr[i];
			}
		}
		char[] dArr = new char[idx];
		System.arraycopy(cArr, 0, dArr, 0, dArr.length);
		return dArr;
	}

	public static char[] copyOf(char[] arr) {
		char[] carr = new char[0];
		if (arr != null) {
			carr = new char[arr.length];
			System.arraycopy(arr, 0, carr, 0, arr.length);
		}
		return carr;
	}

	public static char[] copyOf(char[] arr, int i) {
		char[] carr = new char[0];
		if (arr != null) {
			if (i > arr.length) {
				i = arr.length;
			}
			carr = new char[i];
			System.arraycopy(arr, 0, carr, 0, i);
		}
		return carr;
	}

	public static char[] random(char[] arr) {
		if (arr == null) {
			return new char[0];
		}
		int count = new Random().nextInt(arr.length);
		count = count > 0 ? count : 1;
		return random(arr, count);
	}

	public static char[] shuffle(char[] arr) {
		if (arr == null) {
			return new char[0];
		}
		return random(arr, arr.length);
	}

	public static char[] random(char[] arr, int count) {
		char[] rarr = new char[0];
		if (arr != null) {
			if (arr.length < count) {
				count = arr.length;
			}
			Random random = new Random();
			int i = 0;
			int num = 0;
			rarr = new char[count];
			int[] keys = new int[count];
			for (int j = 0; j < keys.length; j++) {
				keys[j] = 0;
			}
			do {
				num = random.nextInt(arr.length);
				if (!inArray(keys, num)) {
					keys[i] = num;
					rarr[i] = arr[num];
					i++;
				}
			} while (i < count);
		}
		return rarr;
	}

	public static boolean inArray(char[] arr, char search) {
		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				if (arr[i] == search) {
					return true;
				}
			}
		}
		return false;
	}

	public static boolean inArray(char[] arr, char[] search) {
		if (search != null) {
			for (int i = 0; i < search.length; i++) {
				if (!inArray(arr, search[i])) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	public static int search(char[] arr, char search) {
		if (arr != null) {
			for (char i = 0; i < arr.length; i++) {
				if (arr[i] == search) {
					return i;
				}
			}
		}
		return -1;
	}

	public static char[] reverse(char[] arr) {
		char[] rarr = new char[0];
		if (arr != null) {
			rarr = new char[arr.length];
			char j = 0;
			for (int i = arr.length - 1; i >= 0; i--) {
				rarr[j++] = arr[i];
			}
		}
		return rarr;
	}

	public static int sizeOf(byte[] arr) {
		return arr == null ? 0 : arr.length;
	}

	public static byte[] merge(byte[]... arrs) {
		byte[] result = new byte[0];
		if (arrs != null) {
			byte count = 0;
			for (byte i = 0; i < arrs.length; i++) {
				count += arrs[i].length;
			}
			result = new byte[count];
			byte arg;
			byte k = 0;
			for (byte i = 0; i < arrs.length; i++) {
				if (arrs[i] == null) {
					continue;
				}
				for (byte j = 0; j < arrs[i].length; j++) {
					arg = arrs[i][j];
					result[k] = arg;
					k++;
				}
			}
		}
		return result;
	}

	public static byte[] diff(byte[] aArr, byte[] bArr) {
		{
			if (aArr == null) {
				return bArr;
			}
			if (bArr == null) {
				return aArr;
			}
		}
		byte[] cArr = new byte[aArr.length + bArr.length];
		byte idx = 0;
		
		for (int i = 0; i < aArr.length; i++) {
			if (!inArray(bArr, aArr[i])) {
				cArr[idx++] = aArr[i];
			}
		}
	
		for (int i = 0; i < bArr.length; i++) {
			if (!inArray(aArr, bArr[i])) {
				cArr[idx++] = bArr[i];
			}
		}
		//
		byte[] dArr = new byte[idx];
		System.arraycopy(cArr, 0, dArr, 0, dArr.length);
		return dArr;
	}


	public static byte[] copyOf(byte[] arr) {
		byte[] carr = new byte[0];
		if (arr != null) {
			carr = new byte[arr.length];
			System.arraycopy(arr, 0, carr, 0, arr.length);
		}
		return carr;
	}

	
	public static byte[] copyOf(byte[] arr, int i) {
		byte[] carr = new byte[0];
		if (arr != null) {
			if (i > arr.length) {
				i = arr.length;
			}
			carr = new byte[i];
			System.arraycopy(arr, 0, carr, 0, i);
		}
		return carr;
	}


	public static byte[] random(byte[] arr) {
		if (arr == null) {
			return new byte[0];
		}
		int count = new Random().nextInt(arr.length);
		count = count > 0 ? count : 1;
		return random(arr, count);
	}

	public static byte[] shuffle(byte[] arr) {
		if (arr == null) {
			return new byte[0];
		}
		return random(arr, arr.length);
	}


	public static byte[] random(byte[] arr, int count) {
		byte[] rarr = new byte[0];
		if (arr != null) {
			if (arr.length < count) {
				count = arr.length;
			}
			Random random = new Random();
			int i = 0;
			int num = 0;
			rarr = new byte[count];
			int[] keys = new int[count];
			for (int j = 0; j < keys.length; j++) {
				keys[j] = 0;
			}
			do {
				num = random.nextInt(arr.length);
				if (!inArray(keys, num)) {
					keys[i] = num;
					rarr[i] = arr[num];
					i++;
				}
			} while (i < count);
		}
		return rarr;
	}

	
	public static boolean inArray(byte[] arr, byte search) {
		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				if (arr[i] == search) {
					return true;
				}
			}
		}
		return false;
	}

	
	public static boolean inArray(byte[] arr, byte[] search) {
		if (search != null) {
			for (int i = 0; i < search.length; i++) {
				if (!inArray(arr, search[i])) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	
	public static int search(byte[] arr, byte search) {
		if (arr != null) {
			for (byte i = 0; i < arr.length; i++) {
				if (arr[i] == search) {
					return i;
				}
			}
		}
		return -1;
	}

	
	public static byte[] reverse(byte[] arr) {
		byte[] rarr = new byte[0];
		if (arr != null) {
			rarr = new byte[arr.length];
			byte j = 0;
			for (int i = arr.length - 1; i >= 0; i--) {
				rarr[j++] = arr[i];
			}
		}
		return rarr;
	}

	
	public static byte[] fill(List<Byte> list) {
		if (list == null) {
			return new byte[0];
		}
		int size = list.size();
		byte[] arr = new byte[size];

		for (int i = 0; i < size; i++) {
			arr[i] = list.get(i);
		}
		return arr;
	}

	
	public static List<Byte> fill(byte[] arr) {
		List<Byte> list = null;
		if (arr == null) {
			return new ArrayList<Byte>(0);
		}
		int size = arr.length;
		list = new ArrayList<Byte>(size);
		for (byte by : arr) {
			list.add(by);
		}
		return list;
	}

	
	public static int sizeOf(Object[] arr) {
		return arr == null ? 0 : arr.length;
	}

	
	public static Object[] merge(Object[]... arrs) {
		Object[] result = new Object[0];
		if (arrs != null) {
			int count = 0;
			for (int i = 0; i < arrs.length; i++) {
				count += arrs[i].length;
			}
			result = new Object[count];
			Object arg;
			int k = 0;
			for (int i = 0; i < arrs.length; i++) {
				if (arrs[i] == null) {
					continue;
				}
				for (int j = 0; j < arrs[i].length; j++) {
					arg = arrs[i][j];
					result[k] = arg;
					k++;
				}
			}
		}
		return result;
	}

	
	public static Object[] diff(Object[] aArr, Object[] bArr) {
		{
			if (aArr == null) {
				return bArr;
			}
			if (bArr == null) {
				return aArr;
			}
		}
		Object[] cArr = new Object[aArr.length + bArr.length];
		int idx = 0;
		
		for (int i = 0; i < aArr.length; i++) {
			if (!inArray(bArr, aArr[i])) {
				cArr[idx++] = aArr[i];
			}
		}
		
		for (int i = 0; i < bArr.length; i++) {
			if (!inArray(aArr, bArr[i])) {
				cArr[idx++] = bArr[i];
			}
		}
		//
		Object[] dArr = new Object[idx];
		System.arraycopy(cArr, 0, dArr, 0, dArr.length);
		return dArr;
	}

	
	public static Object[] copyOf(Object[] arr) {
		Object[] carr = new Object[0];
		if (arr != null) {
			carr = new Object[arr.length];
			System.arraycopy(arr, 0, carr, 0, arr.length);
		}
		return carr;
	}

	public static Object[] copyOf(Object[] arr, int i) {
		Object[] carr = new Object[0];
		if (arr != null) {
			if (i > arr.length) {
				i = arr.length;
			}
			carr = new Object[i];
			System.arraycopy(arr, 0, carr, 0, i);
		}
		return carr;
	}

	
	public static Object[] random(Object[] arr) {
		if (arr == null) {
			return new Object[0];
		}
		int count = new Random().nextInt(arr.length);
		count = count > 0 ? count : 1;
		return random(arr, count);
	}

	
	public static Object[] shuffle(Object[] arr) {
		if (arr == null) {
			return new Object[0];
		}
		return random(arr, arr.length);
	}

	public static Object[] random(Object[] arr, int count) {
		Object[] rarr = new Object[0];
		if (arr != null) {
			if (arr.length < count) {
				count = arr.length;
			}
			Random random = new Random();
			int i = 0;
			int num = 0;
			rarr = new Object[count];
			int[] keys = new int[count];
			for (int j = 0; j < keys.length; j++) {
				keys[j] = -1;
			}
			do {
				num = random.nextInt(arr.length);
				if (!inArray(keys, num)) {
					keys[i] = num;
					rarr[i] = arr[num];
					i++;
				}
			} while (i < count);
		}
		return rarr;
	}

	public static boolean inArray(Object[] arr, Object search) {
		if (arr != null && search != null) {
			for (int i = 0; i < arr.length; i++) {
				if (search.equals(arr[i])) {
					return true;
				}
			}
		}
		return false;
	}

	public static boolean inArray(Object[] arr, Object[] search) {
		if (search != null) {
			for (int i = 0; i < search.length; i++) {
				if (!inArray(arr, search[i])) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	public static int search(Object[] arr, Object search) {
		if (arr != null && search != null) {
			for (int i = 0; i < arr.length; i++) {
				if (search.equals(arr[i])) {
					return i;
				}
			}
		}
		return -1;
	}

	public static Object[] reverse(Object[] arr) {
		Object[] rarr = new Object[0];
		if (arr != null) {
			rarr = new Object[arr.length];
			int j = 0;
			for (int i = arr.length - 1; i >= 0; i--) {
				rarr[j++] = arr[i];
			}
		}
		return rarr;
	}

	public static int sizeOf(String[] arr) {
		return arr == null ? 0 : arr.length;
	}

	public static String[] merge(String[]... arrs) {
		String[] result = new String[0];
		if (arrs != null) {
			int count = 0;
			for (int i = 0; i < arrs.length; i++) {
				count += arrs[i].length;
			}
			result = new String[count];
			String arg;
			int k = 0;
			for (int i = 0; i < arrs.length; i++) {
				if (arrs[i] == null) {
					continue;
				}
				for (int j = 0; j < arrs[i].length; j++) {
					arg = arrs[i][j];
					result[k] = arg;
					k++;
				}
			}
		}
		return result;
	}

	public static String[] diff(String[] aArr, String[] bArr) {
		{
			if (aArr == null) {
				return bArr;
			}
			if (bArr == null) {
				return aArr;
			}
		}
		String[] cArr = new String[aArr.length + bArr.length];
		int idx = 0;
		for (int i = 0; i < aArr.length; i++) {
			if (!inArray(bArr, aArr[i])) {
				cArr[idx++] = aArr[i];
			}
		}
		for (int i = 0; i < bArr.length; i++) {
			if (!inArray(aArr, bArr[i])) {
				cArr[idx++] = bArr[i];
			}
		}
		//
		String[] dArr = new String[idx];
		System.arraycopy(cArr, 0, dArr, 0, dArr.length);
		return dArr;
	}

	public static String[] copyOf(String[] arr) {
		String[] carr = new String[0];
		if (arr != null) {
			carr = new String[arr.length];
			System.arraycopy(arr, 0, carr, 0, arr.length);
		}
		return carr;
	}

	public static String[] copyOf(String[] arr, int i) {
		String[] carr = new String[0];
		if (arr != null) {
			if (i > arr.length) {
				i = arr.length;
			}
			carr = new String[i];
			System.arraycopy(arr, 0, carr, 0, i);
		}
		return carr;
	}

	public static String[] random(String[] arr) {
		if (arr == null) {
			return new String[0];
		}
		int count = new Random().nextInt(arr.length);
		count = count > 0 ? count : 1;
		return random(arr, count);
	}

	public static String[] shuffle(String[] arr) {
		if (arr == null) {
			return new String[0];
		}
		return random(arr, arr.length);
	}

	public static String[] random(String[] arr, int count) {
		String[] rarr = new String[0];
		if (arr != null) {
			if (arr.length < count) {
				count = arr.length;
			}
			Random random = new Random();
			int i = 0;
			int num = 0;
			rarr = new String[count];
			int[] keys = new int[count];
			for (int j = 0; j < keys.length; j++) {
				keys[j] = -1;
			}
			do {
				num = random.nextInt(arr.length);
				if (!inArray(keys, num)) {
					keys[i] = num;
					rarr[i] = arr[num];
					i++;
				}
			} while (i < count);
		}
		return rarr;
	}

	public static boolean inArray(String[] arr, String search) {
		if (arr != null && search != null) {
			for (int i = 0; i < arr.length; i++) {
				if (search.equals(arr[i])) {
					return true;
				}
			}
		}
		return false;
	}

	public static boolean inArray(String[] arr, String[] search) {
		if (search != null) {
			for (int i = 0; i < search.length; i++) {
				if (!inArray(arr, search[i])) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	public static int search(String[] arr, String search) {
		if (arr != null && search != null) {
			for (int i = 0; i < arr.length; i++) {
				if (search.equals(arr[i])) {
					return i;
				}
			}
		}
		return -1;
	}

	public static String[] reverse(String[] arr) {
		String[] rarr = new String[0];
		if (arr != null) {
			rarr = new String[arr.length];
			int j = 0;
			for (int i = arr.length - 1; i >= 0; i--) {
				rarr[j++] = arr[i];
			}
		}
		return rarr;
	}

	public static String join(String[] strs, String sep) {
		StringBuilder strBuilder = new StringBuilder();
		if (strs != null) {
			for (int i = 0; i < strs.length; i++) {
				strBuilder.append(strs[i]);
				if (i < strs.length - 1) {
					strBuilder.append(sep);
				}
			}
		}
		return strBuilder.toString();
	}
	
	
}