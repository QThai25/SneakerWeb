package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private int cartId;             // ID của giỏ hàng
    private int userId;             // ID của người dùng
    private int productId;             // ID của người dùng
    private String createdAt;       // Ngày tạo giỏ hàng
    private List<Item> items;       // Danh sách các mục (Item) trong giỏ hàng
    private int quantity;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    // Constructor
    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(int cartId, int userId, String createdAt) {
        this.cartId = cartId;
        this.userId = userId;
        this.createdAt = createdAt;
        this.items = new ArrayList<>();
    }

    public Cart(int userId, int productId, int quantity, String createdAt) {
        this.userId = userId;
        this.productId = productId;
        this.createdAt = createdAt;
        this.quantity = quantity;
    }

    
    public Cart(int cartId, int userId, int productId,  int quantity, String createdAt) {
        this.cartId = cartId;
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.createdAt = createdAt;
    }
    

    // Getter và Setter
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    // Thêm một sản phẩm vào giỏ hàng
    public void addItem(Item item) {
        // Kiểm tra xem sản phẩm đã có trong giỏ chưa
        Item existingItem = getItemById(item.getProduct().getProductId());
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    // Xóa một sản phẩm khỏi giỏ hàng theo ID sản phẩm
    public void removeItem(int productId) {
        Item item = getItemById(productId);
        if (item != null) {
            items.remove(item);
        }
    }

    // Cập nhật số lượng của sản phẩm theo ID
    public void updateQuantity(int productId, int quantity) {
        Item item = getItemById(productId);
        if (item != null) {
            if (quantity <= 0) {
                removeItem(productId); // Nếu quantity nhỏ hơn hoặc bằng 0 thì xóa sản phẩm
            } else {
                item.setQuantity(quantity);
            }
        }
    }

    // Lấy thông tin sản phẩm theo ID
    public Item getItemById(int productId) {
        for (Item item : items) {
            if (item.getProduct().getProductId() == productId) {
                return item;
            }
        }
        return null;
    }

    // Lấy số lượng của sản phẩm theo ID
    public int getQuantityById(int productId) {
        Item item = getItemById(productId);
        if (item != null) {
            return item.getQuantity();
        }
        return 0;
    }

    // Tính tổng tiền của giỏ hàng
    public double getTotalMoney() {
        double total = 0;
        for (Item item : items) {
            total += item.getQuantity() * item.getProduct().getPrice();
        }
        return total;
    }
}
