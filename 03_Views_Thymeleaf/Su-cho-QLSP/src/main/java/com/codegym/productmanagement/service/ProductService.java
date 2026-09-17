package com.codegym.productmanagement.service;

import com.codegym.productmanagement.model.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService implements IProductService {
    private static final Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "iPhone 15 Pro", 999.0, "Titanium design, A17 Pro chip", "Apple"));
        products.put(2, new Product(2, "Samsung Galaxy S24 Ultra", 1199.0, "Galaxy AI, 200MP camera", "Samsung"));
        products.put(3, new Product(3, "Sony WH-1000XM5", 399.0, "Industry-leading noise canceling", "Sony"));
        products.put(4, new Product(4, "Dell XPS 13", 1299.0, "Intel Core Ultra, OLED display", "Dell"));
        products.put(5, new Product(5, "MacBook Pro 14", 1599.0, "M3 chip, Liquid Retina XDR", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        if (name == null || name.trim().isEmpty()) {
            return findAll();
        }
        String keyword = name.trim().toLowerCase();
        for (Product product : products.values()) {
            if (product.getName() != null && product.getName().toLowerCase().contains(keyword)) {
                result.add(product);
            }
        }
        return result;
    }
}
