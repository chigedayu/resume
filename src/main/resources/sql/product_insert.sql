-- 插入25条测试数据
INSERT INTO products (product_code, product_name, product_image, category, specification, unit, purchase_price, selling_price, min_stock, max_stock, current_stock, status) VALUES
                                                                                                                                                                                ('P1001', 'iPhone 15 Pro', 'iphone15.jpg', '手机', '256GB 深空黑', '台', 6999.00, 8999.00, 5, 50, 28, 1),
                                                                                                                                                                                ('P1002', '华为Mate 60', 'mate60.jpg', '手机', '512GB 雅川青', '台', 5499.00, 6999.00, 3, 30, 15, 1),
                                                                                                                                                                                ('P1003', '小米14 Ultra', 'mi14u.jpg', '手机', '1TB 白色', '台', 4999.00, 6499.00, 2, 20, 8, 1),
                                                                                                                                                                                ('P2001', '得力中性笔', 'pen01.jpg', '文具', '0.5mm 黑色12支装', '盒', 8.50, 15.00, 20, 200, 86, 1),
                                                                                                                                                                                ('P2002', '晨光A4打印纸', 'paper01.jpg', '耗材', '80g 500张/包', '包', 25.00, 38.00, 10, 100, 42, 1),
                                                                                                                                                                                ('P2003', '惠普墨盒', 'ink01.jpg', '耗材', 'HP 664黑色', '个', 89.00, 129.00, 5, 50, 23, 1),
                                                                                                                                                                                ('P3001', '农夫山泉矿泉水', 'water01.jpg', '饮品', '550ml*24瓶', '箱', 18.00, 30.00, 10, 100, 57, 1),
                                                                                                                                                                                ('P3002', '康师傅红烧牛肉面', 'noodle01.jpg', '食品', '桶装12桶/箱', '箱', 28.00, 45.00, 15, 150, 92, 1),
                                                                                                                                                                                ('P3003', '德芙巧克力', 'choco01.jpg', '零食', '牛奶味150g', '盒', 12.00, 22.00, 8, 80, 31, 1),
                                                                                                                                                                                ('P4001', '洁柔抽纸', 'tissue01.jpg', '日用品', '3层120抽*24包', '箱', 55.00, 85.00, 5, 60, 29, 1),
                                                                                                                                                                                ('P4002', '蓝月亮洗衣液', 'detergent01.jpg', '清洁', '3kg 薰衣草香', '瓶', 32.00, 49.00, 10, 80, 38, 1),
                                                                                                                                                                                ('P4003', '苏泊尔电饭煲', 'cooker01.jpg', '家电', '4L IH电磁加热', '台', 299.00, 459.00, 3, 30, 11, 1),
                                                                                                                                                                                ('P5001', '优衣库纯棉T恤', 'tshirt01.jpg', '服装', 'XL码 白色', '件', 59.00, 99.00, 10, 100, 64, 1),
                                                                                                                                                                                ('P5002', '耐克运动鞋', 'shoe01.jpg', '鞋类', '42码 黑色', '双', 399.00, 599.00, 3, 30, 17, 1),
                                                                                                                                                                                ('P5003', '李宁篮球', 'ball01.jpg', '体育', '7号标准球', '个', 89.00, 149.00, 5, 50, 22, 1),
                                                                                                                                                                                ('P6001', '欧莱雅洗发水', 'shampoo01.jpg', '个护', '500ml 去屑型', '瓶', 45.00, 69.00, 8, 80, 41, 1),
                                                                                                                                                                                ('P6002', '雅诗兰黛小棕瓶', 'cream01.jpg', '护肤', '50ml 修护精华', '瓶', 599.00, 899.00, 2, 20, 9, 1),
                                                                                                                                                                                ('P6003', 'MAC口红', 'lipstick01.jpg', '彩妆', '#316 柔雾小辣椒', '支', 129.00, 199.00, 5, 50, 26, 1),
                                                                                                                                                                                ('P7001', '三体全集', 'book01.jpg', '图书', '精装版全三册', '套', 98.00, 158.00, 3, 30, 14, 1),
                                                                                                                                                                                ('P7002', 'Python编程入门', 'book02.jpg', '图书', '第3版', '本', 49.00, 79.00, 5, 50, 27, 1),
                                                                                                                                                                                ('P7003', '周杰伦CD专辑', 'cd01.jpg', '音像', '《最伟大的作品》', '张', 89.00, 129.00, 2, 20, 7, 1),
                                                                                                                                                                                ('P8001', '天堂晴雨伞', 'umbrella01.jpg', '日用', '三折黑胶防晒', '把', 35.00, 59.00, 5, 50, 19, 1),
                                                                                                                                                                                ('P8002', '乐高积木', 'toy01.jpg', '玩具', '城市系列60292', '盒', 199.00, 299.00, 3, 30, 12, 1),
                                                                                                                                                                                ('P8003', '飞利浦电动牙刷', 'toothbrush01.jpg', '个护', 'HX6730/02', '支', 199.00, 329.00, 4, 40, 18, 1);


select * from products;