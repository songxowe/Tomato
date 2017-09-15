package com.spring.action;

import java.io.ByteArrayInputStream;

import com.opensymphony.xwork2.ActionContext;
import com.spring.util.RandomCodeUtil;

public class RandomCodeAction {
  private static final long serialVersionUID = 1L;
  private ByteArrayInputStream inputStream;

  public ByteArrayInputStream getInputStream() {
    return inputStream;
  }

  public void setInputStream(ByteArrayInputStream inputStream) {
    this.inputStream = inputStream;
  }

  public String execute() throws Exception {
    RandomCodeUtil randomCodeUtil = RandomCodeUtil.Instance();
    this.setInputStream(randomCodeUtil.getImage());
    ActionContext.getContext().getSession().put("validateCode",
        randomCodeUtil.getString());
    return "success";
  }
}
