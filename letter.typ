#let authors(from: (), reply: ()) = [
  #set text(size: 8pt)

  == Van: \

  #for author in from [
    #show heading: it => block(upper(it.body))

    === #author.name

    #if "email" in author [
      *Email*:~#link("mailto:" + author.email) \
    ]
    #if "phone" in author [
      *Tel.*:~#link("tel:" + author.phone) \
    ]
    #if "meta" in author [
      #for (key, value) in author.meta [
        *#key*:~#value \
      ]
    ]
  ]

  #pad(top: 1em)[
    == Retouradres: \

    #reply.address \
    #{reply.zip + sym.space.en + reply.city}
  ]
]

#let letter(
  doc,
  from: (),
  reply: (),
  to: (),
  date: text(fill: red)[date is not set],
  subject: text(fill: red)[subject is not set],
) = {
  set document(author: from.map(author => author.name))
  set page(
    paper: "a4",
    header: text(size: 8pt, fill: luma(50%))[Betreft:~#subject],
    header-ascent: 4em,
    footer: [
      #set align(end)
      #set text(8pt)
      #counter(page).display((number, total) => text[Pagina #number van #total], both: true)
    ],
  )
  set text(font: "PT Sans", size: 10pt, lang: "nl")

  grid(
    columns: (5cm, 100% - 10cm, 5cm),
    [
      *#to.name* \
      #if "department" in to [
        *#to.department* \
      ]

      #to.address \
      #{to.zip + sym.space.en + to.city}
      #parbreak()
    ],
    [],
    authors(from: from, reply: reply),
  )

  pad(top: 3em)[
    *Datum:*~#date\
    *Betreft:*~#subject
  ]

  pad(top: 3em)[
    Geachte heer / mevrouw, \
    #doc
  ]

  pad(top: 3em)[
    Met vriendelijke groet, \

    #for author in from [
      _ #author.name _ \
    ]
  ]
}
