package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void add(Product product);

    void edit(int id, Product product);

    void delete(int id);

    Product getProductById(int id);

    Product findByName(String name);
}
