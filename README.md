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

1.2, Trong Erlang, biên dịch tệp mã nguồn server bằng lệnh `c(TEN_TEP).` Ví dụ trong code của chúng ta là:  `c(prime_server).`

![unnamed (1)](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/b0330672-1482-4f09-bb29-38ffd78b4809)

như hình ảnh trên là đã thành công biên dịch mã nguồn.

1.3, Bắt đầu máy chủ bằng cách gọi hàm `prime_server:start_server().` trong Erlang.

![unnamed (2)](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/f1fd84fb-f04a-4200-9dae-909432f1b737)

1.4, Bây giờ bạn có thể tạo các tiến trình công nhân giả lập. Hãy tạo một số công nhân và yêu cầu cho chúng để thực hiện kiểm tra số nguyên tố bằng câu lệnh: `Worker1 = spawn(fun() -> prime_server:handle_worker_request(self()) end).`
và chạy tiếp lệnh: `prime_server:handle_worker_response(Worker1, 7, 7).`

*Lưu ý: đối số 7 ở giữa trong câu lệnh có thể thay đổi tùy ý để kiểm tra số nguyên tố, và đối số 7 ở cuối  là một số nguyên tố bất kỳ để so sánh kết quả từ hàm fermat:fermat/1*

![unnamed (3)](https://github.com/tailucanh/Primy_finding_a_large_prime/assets/93418649/e374ddc3-8318-409e-843d-1ce120e90008)

--> Kết quả trả về: Prime 7 is prime. và New highest prime found: 7.
 ### *Chúng ta có thể kiểm tra thêm nhiều số nguyên tố hơn bằng cách lặp lại bước 1.4.*
