# Primy: finding a large prime

## 1. Giới thiệu
   Chúng ta sẽ triển khai một hệ thống phân tán để tìm các số nguyên tố lớn. Hệ thống nên bao gồm một máy chủ đảm nhận việc điều khiển quá trình tính toán, và một tập hợp động các công nhân (a dynamic set of workers) được giao các số để kiểm tra xem chúng có phải là số nguyên tố không.
## 2. Đề bài gốc
## Primy: finding a large prime

Your task will be to implement a distributed system that will find large primes. The system should have one server that is in control of the computation and a dynamic set of workers that are assigned numbers to test for primality.


### Bước 1: Cài đặt Erlang và tạo các file liên quan.
1.1, Cài đặt Erlang cho máy tính [tại đây.](https://www.erlang.org/downloads)

1.2, Sau khi cài đặt xong, có thể dùng Visual Studio Code để khởi tạo các file liên quan. Tạo project mới cùng các file là fermat.erl chứa mã code thuật toán Fermat, prime_server.erl để triển khai máy chủ như mã code ở trên.
### Bước 2: Chạy chương trình để test thuật toán.
1.1, Chạy Terminal trong VS CODE và gõ lệnh `erl`.

![unnamed](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/77b7d300-1f04-414e-b5cf-541a4a40eb47)

1.2, Trong Erlang, biên dịch mỗi tệp mã nguồn bằng lệnh `c(TEN_TEP).` Ví dụ trong code của chungs ta là:  `c(fermat).` và `c(prime_server).`

![unnamed (1)](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/6511bee7-c027-4c7d-9ef5-035822975323)

như hình ảnh trên là đã thành công biên dịch mã nguồn.

1.3, Bắt đầu máy chủ bằng cách gọi hàm `prime_server:start_server().` trong Erlang.

![unnamed (2)](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/b3933184-e704-442d-9c68-6bfaeb668c17)

1.4, Bây giờ bạn có thể tạo các tiến trình công nhân giả lập. Hãy tạo một số công nhân và yêu cầu cho chúng để thực hiện kiểm tra số nguyên tố bằng câu lệnh: `Worker1 = spawn(fun() -> prime_server:handle_worker_request(self()) end).`
và chạy tiếp lệnh:
`prime_server:handle_worker_response(Worker1, 17).`

![unnamed (3)](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/ace5a08a-9986-4452-9bb5-0b5733bf8fd1)

*Lưu ý: đối số 17 trong câu lệnh có thể thay đổi tùy ý để kiểm tra số nguyên tố*


--> Kết quả trả về: New highest prime found: 17.
 ### *Chúng ta có thể kiểm tra thêm nhiều số nguyên tố hơn bằng cách lặp lại bước 1.4.*
