/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import Model.Product;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class SanphamDTO  implements Serializable {
    Product sanPham;
int soluong ;

    public Product getSanPham() {
        return sanPham;
       
    }

    public void setSanPham(Product sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoluong() {
        return soluong;
    }

    public SanphamDTO(Product sanPham) {
        this.sanPham = sanPham;
        this.soluong = 1;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
}
