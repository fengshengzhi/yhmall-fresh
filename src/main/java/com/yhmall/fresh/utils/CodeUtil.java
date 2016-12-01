package com.yhmall.fresh.utils;

import java.util.concurrent.atomic.AtomicInteger;

public class CodeUtil {

	private static AtomicInteger mfOrderCounter = new AtomicInteger(0);
	
	
	private static AtomicInteger gfOrderCounter = new AtomicInteger(0);
	
	
	/**
	 * 获取MF订单编号
	 */
	public static String getMFOrderCode() {
		/*if (mfOrderCounter.get() > 999999) {
			mfOrderCounter.set(1);
		}*/
		RandomGUID myGUID = new RandomGUID();
		StringBuffer buffer  = new StringBuffer();
		buffer.append("MF");
		buffer.append(DateUtil.getCurDateStr("yyyyMMdd"));
		/*buffer.append(String.format("%06d", mfOrderCounter.getAndIncrement()));*/
		buffer.append(myGUID.toString().substring(0,6));
		return buffer.toString();
	}
	
	
	/**
	 * 获取订单编号
	 */
	public static String getGFOrderCode() {
		/*if (gfOrderCounter.get() > 999999) {
			gfOrderCounter.set(1);
		}*/
		RandomGUID myGUID = new RandomGUID();
		StringBuffer buffer  = new StringBuffer();
		buffer.append("GF");
		buffer.append(DateUtil.getCurDateStr("yyyyMMdd"));
		buffer.append(myGUID.toString().substring(0,6));
		return buffer.toString();
	}
	/**
     * 获取供应商编号
     */
    public static String getSupplierCode() {
        RandomGUID myGUID = new RandomGUID();
        StringBuffer buffer  = new StringBuffer();
        buffer.append("GY");
        buffer.append(DateUtil.getCurDateStr("yyyyMMdd"));
        buffer.append(myGUID.toString().substring(0,6));
        return buffer.toString();
    }
    /**
     * 获取供应商编号
     */
    public static String getWithdrawCode() {
        RandomGUID myGUID = new RandomGUID();
        StringBuffer buffer  = new StringBuffer();
        buffer.append("TX");
        buffer.append(DateUtil.getCurDateStr("yyyyMMdd"));
        buffer.append(myGUID.toString().substring(0,6));
        return buffer.toString();
    }
}
