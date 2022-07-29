package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void add(Product product);

    void edit(int id, Product product);

    void delete(int id);

    Product getProductById(int id);

    List<Product>findByName(String name);

}
