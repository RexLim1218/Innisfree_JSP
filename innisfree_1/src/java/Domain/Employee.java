/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.sql.Timestamp;

/**
 *
 * @author Rex Lim
 */
public class Employee {
    private int empID;
    private String position;
    private String empUsername;
    private String empName;
    private String empPwd;
    private Timestamp empCrDate;
    private String empCrBy;
    private Timestamp empUpDate;
    private String empUpBy;
    private String empHp;
    private String empEmail;
    private String empStatus;

    public Employee() {
    }

    
    
    public Employee(int empID, String position, String empUsername, String empName, String empPwd, Timestamp empCrDate, String empCrBy, Timestamp empUpDate, String empUpBy, String empHp, String empEmail, String empStatus) {
        this.empID = empID;
        this.position = position;
        this.empUsername = empUsername;
        this.empName = empName;
        this.empPwd = empPwd;
        this.empCrDate = empCrDate;
        this.empCrBy = empCrBy;
        this.empUpDate = empUpDate;
        this.empUpBy = empUpBy;
        this.empHp = empHp;
        this.empEmail = empEmail;
        this.empStatus = empStatus;
    }

    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmpUsername() {
        return empUsername;
    }

    public void setEmpUsername(String empUsername) {
        this.empUsername = empUsername;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpPwd() {
        return empPwd;
    }

    public void setEmpPwd(String empPwd) {
        this.empPwd = empPwd;
    }

    public Timestamp getEmpCrDate() {
        return empCrDate;
    }

    public void setEmpCrDate(Timestamp empCrDate) {
        this.empCrDate = empCrDate;
    }

    public String getEmpCrBy() {
        return empCrBy;
    }

    public void setEmpCrBy(String empCrBy) {
        this.empCrBy = empCrBy;
    }

    public Timestamp getEmpUpDate() {
        return empUpDate;
    }

    public void setEmpUpDate(Timestamp empUpDate) {
        this.empUpDate = empUpDate;
    }

    public String getEmpUpBy() {
        return empUpBy;
    }

    public void setEmpUpBy(String empUpBy) {
        this.empUpBy = empUpBy;
    }

    public String getEmpHp() {
        return empHp;
    }

    public void setEmpHp(String empHp) {
        this.empHp = empHp;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getEmpStatus() {
        return empStatus;
    }

    public void setEmpStatus(String empStatus) {
        this.empStatus = empStatus;
    }
    
    
    
    
    
}
