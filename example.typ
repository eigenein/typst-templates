#import "letter.typ": letter

#show: doc => letter(
  doc,
  from: (
    (
      name: "Dhr. Lorem Ipsum Dolor",
      email: "lorem@ipsum.dolor",
      phone: "0123456789",
      meta: (BSN: "12345678"),
    ),
    (
      name: "Mevr. Sit Amet",
      email: "sit.amet@ipsum.dolor",
      phone: "0123456789",
    ),
  ),
  reply: (address: "Straat 24", zip: "2345 BC", city: "Den Haag"),
  to: (
    name: "Lorem Ipsum",
    department: "Consectetur adipiscing elit",
    address: "Straat 1",
    zip: [1234 AB],
    city: "Amsterdam",
  ),
  date: [22 maart 2023],
  subject: [Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt],
)

#lorem(100)

#lorem(50)

#lorem(50)
