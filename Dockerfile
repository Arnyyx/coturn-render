# Sử dụng image Coturn phiên bản cụ thể để đảm bảo ổn định
FROM coturn/coturn:4.6.2

# Copy file cấu hình vào container
COPY turnserver.conf /etc/turnserver.conf

# Chạy Coturn với user không phải root để tránh lỗi quyền
USER turnserver

# Mở cổng cần thiết cho STUN/TURN
EXPOSE 3478 3478/udp 5349 5349/udp

# Command chạy Coturn với file cấu hình
CMD ["turnserver", "-c", "/etc/turnserver.conf"]