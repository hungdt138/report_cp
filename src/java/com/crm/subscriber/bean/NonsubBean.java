/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crm.subscriber.bean;

/**
 *
 * @author hungdt
 */
public class NonsubBean {

    private String serviceAddr = "";
    private int mo = 0;
    private int mt = 0;

    private String dateTime = "";

    private int telcoId = 0;

    private String cmdCode = "";

    public String getCmdCode() {
        return cmdCode;
    }

    public void setCmdCode(String cmdCode) {
        this.cmdCode = cmdCode;
    }

    /**
     * Get the value of telcoId
     *
     * @return the value of telcoId
     */
    public int getTelcoId() {
        return telcoId;
    }

    /**
     * Set the value of telcoId
     *
     * @param telcoId new value of telcoId
     */
    public void setTelcoId(int telcoId) {
        this.telcoId = telcoId;
    }

    /**
     * Get the value of dateTime
     *
     * @return the value of dateTime
     */
    public String getDateTime() {
        return dateTime;
    }

    /**
     * Set the value of dateTime
     *
     * @param dateTime new value of dateTime
     */
    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getServiceAddr() {
        return serviceAddr;
    }

    public void setServiceAddr(String serviceAddr) {
        this.serviceAddr = serviceAddr;
    }

    public int getMo() {
        return mo;
    }

    public void setMo(int mo) {
        this.mo = mo;
    }

    public int getMt() {
        return mt;
    }

    public void setMt(int mt) {
        this.mt = mt;
    }

}
