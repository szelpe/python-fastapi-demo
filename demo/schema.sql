CREATE TABLE product (
    sku VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    description TEXT,
    specs VARCHAR(255),
    price DECIMAL(15, 4) NOT NULL,
    avg_score REAL,
    stock INT,
    weight REAL,
    size VARCHAR(255),
    location VARCHAR(255)
);

INSERT INTO product (sku, name, brand, description, specs, price, avg_score, stock, weight, size, location) VALUES
('12345', 'HydroFlow Smart Water Bottle', 'HydroTech', 'Intelligent water bottle that tracks hydration and keeps water cold for 24 hours', 'Double-wall insulation', 100, 4.5, 10, 0.5, '9x4x4', 'Store A'),
('67890', 'ZenBreeze Aroma Diffuser', 'AromaWave', 'Ultrasonic essential oil diffuser with 7 color LED and timer', '500ml capacity', 150, 4, 5, 1, '6x6x8', 'Store A'),
('11223', 'VoltMax Powerbank', 'PowerCore', 'High-capacity portable power bank with fast charging and multiple ports', '20000mAh', 200, 4.7, 7, 0.6, '5x3x1', 'Store B'),
('44556', 'AirGlide Hoverboard', 'GlideMaster', 'Self-balancing hoverboard with LED lights and Bluetooth speakers', 'Dual motor 500W', 300, 3.8, 20, 8, '25x10x8', 'Store A'),
('77889', 'QuantumX Gaming Headset', 'SoundCore', 'Wireless gaming headset with surround sound and noise-cancelling mic', '7.1 surround sound', 250, 4.9, 4, 0.7, '8x7x4', 'Store B'),
('99001', 'UltraSonic Electric Toothbrush', 'DentiCare', 'Rechargeable electric toothbrush with 5 modes and smart timer', '40.000 vibrations per minute', 80, 3.5, 50, 0.3, '9x2x2', 'Store A'),
('22334', 'HyperVolt Muscle Massager', 'RelaxoTech', 'Deep tissue massage gun with 6 speeds and 4 interchangeable heads', '3200 RPM motor', 180, 4.8, 3, 1.5, '10x6x3', 'Store A'),
('55667', 'TerraGrow Indoor Garden Kit', 'GreenThumb', 'Indoor hydroponic garden with LED grow lights and automated watering', '6 plant capacity', 120, 4.1, 15, 3, '18x10x12', 'Store B'),
('88990', 'SunBlaze Solar Charger', 'SunTech', 'Portable solar charger for phones and small devices', '10W solar panel', 90, 3.9, 30, 0.2, '11x6x1', 'Store B'),
('10112', 'CosmosStar Telescope', 'StarGazer', 'High-power telescope for stargazing with 70mm aperture and adjustable tripod', '700mm focal length', 500, 5, 2, 4.5, '24x10x8', 'Store B');

