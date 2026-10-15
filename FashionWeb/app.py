from flask import Flask, render_template, request, redirect, url_for
import pymssql

app = Flask(__name__)

def get_db_connection():
    conn = pymssql.connect(
        server='127.0.0.1:1433',  # Chỉ định rõ cổng 1433
        database='QuanLyBanHangThoiTrang'
    )
    return conn

# 1. Trang chủ
@app.route('/')
def index():
    return render_template('index.html')

# 2. Trang mua hàng (Hiển thị sản phẩm từ CSDL)
@app.route('/shop')
def shop():
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)
    cursor.execute("SELECT * FROM SanPham")
    products = cursor.fetchall()
    conn.close()
    return render_template('shop.html', products=products)

# 3. Trang liên hệ
@app.route('/contact')
def contact():
    return render_template('contact.html')

# 4. Trang quản trị (Admin)
@app.route('/admin')
def admin():
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)
    cursor.execute("SELECT * FROM SanPham")
    products = cursor.fetchall()
    conn.close()
    return render_template('admin.html', products=products)

if __name__ == '__main__':
    app.run(debug=True)
    