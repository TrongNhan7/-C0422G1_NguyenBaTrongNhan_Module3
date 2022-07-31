package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productList = new HashMap<>();

    static {
        productList.put(1, new Product(1, "KiaK149", 300, "Chạy phụt sau", "Kia"));
        productList.put(2, new Product(2, "KiaK150", 410, "Chạy nhíp sau", "Kia"));
        productList.put(3, new Product(3, "FD500", 550, "Xe ben", "Foland"));
        productList.put(4, new Product(4, "TF7.5", 700, "Xe Nhật Bản", "Fuso"));
        productList.put(5, new Product(5, "Garden79s", 990, "Xe Bus", "Thaco"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void add(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        productList.put(id, product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public Product getProductById(int id) {
        return productList.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList1 = new ArrayList<>(productList.values());
        List<Product> products = new ArrayList<>();

        for (Product product : productList1) {
            if (product.getNameProduct().contains(name)) {
                products.add(product);
            }
        }
        return products;
    }

//    @Override
//    public Product findByName(String name) {
//        for (Map.Entry<Integer, Product> entry : productList.entrySet()) {
//            if(entry.getValue().getNameProduct().contains(name)){
//                return productList.get(entry.getValue().getId());
//            }
//        }
//        return null;
//    }
}
