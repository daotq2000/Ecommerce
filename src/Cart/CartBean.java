/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import Model.Product;
import java.util.HashMap;

/**
 *
 * @author Administrator
 */
public class CartBean extends HashMap{
    public void ThemSanPham(SanphamDTO sp ) {
		String key = sp.getSanPham().getIdProduct();
		if(this.containsKey(key)) {
			int oldQuanlity = ((SanphamDTO)this.get(key)).getSoluong();
			((SanphamDTO)this.get(key)).setSoluong(oldQuanlity+1);
		}else {
			this.put(sp.getSanPham().getIdProduct(), sp);
		}
		
	}
    public boolean reMoveSP(String code) {
		if(this.containsKey(code)) {
			this.remove(code);
			return true;
		}
		
		return false;
	}
    	public CartBean() {
		super();
	}
     
     
}
