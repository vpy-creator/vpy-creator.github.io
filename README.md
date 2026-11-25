# Ngôi nhà của Vũ Phi Yên · vpy-creator.github.io

Trang web cá nhân, dựng bằng HTML tĩnh, mỗi căn phòng là một thư mục riêng.

## Cây thư mục

```
vpy-creator.github.io/
├── index.html              Hiên nhà (trang chủ)
├── assets/                 ảnh và nhạc của hiên nhà
│   ├── ban-tra.webp        ảnh bàn trà (nền cho tấm thiệp)
│   └── hien-nha.mp3        nhạc hiên nhà
├── phong-tuong-lai/        Phòng Tương lai
│   ├── index.html
│   └── assets/
├── my-treasure-map/        My Treasure Map (trang khóa học)
│   ├── index.html
│   └── assets/             ảnh bản đồ buổi sớm, sổ thực địa, bàn tròn, nhạc lên đường
├── .nojekyll               GitHub Pages phục vụ file y nguyên, bỏ qua Jekyll
└── README.md
```

Địa chỉ khi lên mạng:

- Hiên nhà: `https://vpy-creator.github.io/`
- Phòng Tương lai: `https://vpy-creator.github.io/phong-tuong-lai/`
- My Treasure Map: `https://vpy-creator.github.io/my-treasure-map/`

## Thêm một căn phòng mới

1. Tạo thư mục mới ở gốc, tên viết thường, gạch nối, không dấu: `hoc-cung-yen/`, `phong-khach/`, `xem-phim/`.
2. Đặt trang của phòng tên `index.html` trong thư mục ấy; ảnh và nhạc của riêng phòng để trong `assets/` của chính thư mục đó, gọi bằng đường dẫn tương đối `assets/...`.
3. Nút về nhà trong phòng trỏ về `../`.
4. Mở `index.html` ở gốc, tìm căn phòng ấy trong bản vẽ ngôi nhà và trong phần "Lối lên tầng cao", đổi đường dẫn thành tên thư mục mới (ví dụ `href="hoc-cung-yen/"`).

## Hộp thư

Mọi khung thư trên website gửi về cùng một Google Sheet qua Apps Script. Mỗi trang khai một mã `phong` riêng trong khối `HOP_THU` ở cuối file, để thư vào đúng tab.

## Cách đưa lên mạng

```
git add -A
git commit -m "Mô tả thay đổi"
git push
```

GitHub Pages tự dựng lại trong khoảng một phút.
