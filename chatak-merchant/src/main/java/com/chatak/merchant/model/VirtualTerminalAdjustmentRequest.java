/*@Author harish.babu */

/**
 * @Author harish.babu
 */
package com.chatak.merchant.model;

/**
 * 
 *
 */
public class VirtualTerminalAdjustmentRequest {

  
  private String expDate;

  private String merchantId;

  private String terminalId;

  private String invoiceNumber;

  private Long txnAmount;

  private String cardNum;

  private String authId;

  private Long adjAmount;

  private String txnRefNum;

  /**
   * @return the txnAmount
   */
  public Long getTxnAmount() {
    return txnAmount;
  }

  /**
   * @param txnAmount
   *          the txnAmount to set
   */
  public void setTxnAmount(Long txnAmount) {
    this.txnAmount = txnAmount;
  }

  /**
   * @return the expDate
   */
  public String getExpDate() {
    return expDate;
  }

  /**
   * @param expDate
   *          the expDate to set
   */
  public void setExpDate(String expDate) {
    this.expDate = expDate;
  }

  /**
   * @return the terminalId
   */
  public String getTerminalId() {
    return terminalId;
  }

  /**
   * @param terminalId
   *          the terminalId to set
   */
  public void setTerminalId(String terminalId) {
    this.terminalId = terminalId;
  }
  
  /**
   * @return the merchantId
   */
  public String getMerchantId() {
    return merchantId;
  }

  /**
   * @param merchantId
   *          the merchantId to set
   */
  public void setMerchantId(String merchantId) {
    this.merchantId = merchantId;
  }

  /**
   * @return the invoiceNumber
   */
  public String getInvoiceNumber() {
    return invoiceNumber;
  }

  /**
   * @param invoiceNumber
   *          the invoiceNumber to set
   */
  public void setInvoiceNumber(String invoiceNumber) {
    this.invoiceNumber = invoiceNumber;
  }

  /**
   * @return the cardNum
   */
  public String getCardNum() {
    return cardNum;
  }

  /**
   * @param cardNum
   *          the cardNum to set
   */
  public void setCardNum(String cardNum) {
    this.cardNum = cardNum;
  }

  /**
   * @return the authId
   */
  public String getAuthId() {
    return authId;
  }

  /**
   * @param authId
   *          the authId to set
   */
  public void setAuthId(String authId) {
    this.authId = authId;
  }

  /**
   * @return the adjAmount
   */
  public Long getAdjAmount() {
    return adjAmount;
  }

  /**
   * @param adjAmount
   *          the adjAmount to set
   */
  public void setAdjAmount(Long adjAmount) {
    this.adjAmount = adjAmount;
  }

  /**
   * @return the txnRefNum
   */
  public String getTxnRefNum() {
    return txnRefNum;
  }

  /**
   * @param txnRefNum
   *          the txnRefNum to set
   */
  public void setTxnRefNum(String txnRefNum) {
    this.txnRefNum = txnRefNum;
  }

}
