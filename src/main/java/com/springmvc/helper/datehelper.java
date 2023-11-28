package com.springmvc.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class datehelper {
    
    static final SimpleDateFormat DATE_FORMATER = new SimpleDateFormat("yyyy-MM-dd");
    static final SimpleDateFormat TIME_FORMATER = new SimpleDateFormat("hh:mm:ss aa");
        
    
    public static Date toDate(String date, String... pattern) {
        java.util.Date DOB = new java.util.Date();
        try {
            if (pattern.length > 0) {
                DATE_FORMATER.applyPattern(pattern[0]);
            }
            if (date == null) {
                return datehelper.now();
            }
            DOB = DATE_FORMATER.parse(date);
            java.sql.Date sqlDate = null;
            return new java.sql.Date(DOB.getTime());
        } catch (ParseException ex) {
            throw new RuntimeException(ex);
        }
    }

    public static String toString(Date date, String... pattern) {
        if (pattern.length > 0) {
            DATE_FORMATER.applyPattern(pattern[0]);
        }
        if (date == null) {
            date = datehelper.now();
        }
        return DATE_FORMATER.format(date);
    }

    public static String toStringTime(Date date, String... pattern) {
        if (pattern.length > 0) {
            TIME_FORMATER.applyPattern(pattern[0]);
        }
        if (date == null) {
            date = datehelper.now();
        }
        return TIME_FORMATER.format(date);
    }

    public static Date now() {
        java.util.Date DOB = new java.util.Date();
        DOB = new Date();
        return new java.sql.Date(DOB.getTime());
    }

    public static Date addDays(Date date, int days) {
        date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
        return date;
    }

    public static Date add(int days) {
        Date now = datehelper.now();
        now.setTime(now.getTime() + days * 24 * 60 * 60 * 1000);
        return now;
    }
}
