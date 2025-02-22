#let configuration = yaml("configuration.yaml")
#let settings = yaml("settings.yaml")

#show link: set text(blue)
#set page(margin: 1.5cm)
#set par(spacing: 1em)

#show heading: h => [
  #box(
    fill: rgb("#C3E2CA"),
    inset: 4pt,
    radius: 4pt,
    width: 90%,
    height: auto
  )[  
  #set text(
    size: eval(settings.font.size.heading_large),
    font: settings.font.general
  )
  #h
  ]
]


#let sidebarSection = {[
  #block(
    radius: 2em,
    //spacing: 1em,
    clip: true,
    align(alignment.center,
      image("baptiste_carre.jpg", width: 100%))
)
  
  #par(justify: true)[

    #par[
      #set text(
        size: eval(settings.font.size.contacts),
        font: settings.font.minor_highlight,
      )
      
      Email: #link("mailto:" + configuration.contacts.email) \
      Phone: #link("tel:" + configuration.contacts.phone) \
      LinkedIn: #link(configuration.contacts.linkedin)[baptiste-entat] \
      //GitHub: #link(configuration.contacts.github)[baptiste-entat-pantagene] \
      
      #configuration.contacts.address
    ]
    #line(length: 100%)
  ]

  = Sommaire

  #par[
    #set text(
        eval(settings.font.size.education_description),
        font: settings.font.minor_highlight,
    )
    Étudiant en 1ère année d’ingénieur, je recherche un stage en développement backend pour septembre 2025. \
    Passionné par l’innovation, l’objectif est d’intégrer un environnement dynamique afin d’approfondir mes compétences en développement informatique. \
    Rigoureux et autonome, j’aime collaborer et résoudre des défis techniques avec méthode et précision.
  ]

  #{
    for profil in configuration.profils [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
        #set text(
          //size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight,
        )
        *#profil.name* 
        #linebreak()
        #for value in profil.items [
          • #value \
        ]
      ]
    ]
  }

  = Compétences

  #{
    for skill in configuration.skills [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
        #set text(
          // size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight,
        )
        *#skill.name* 
        #linebreak()
        #skill.items.join(" • ")
      ]
    ]
  }


  = Vie associative

  #{
    for asso in configuration.associative [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
         #set text(
          size: eval(settings.font.size.heading_tiny),
          font: settings.font.general
        )
         #link(asso.link)[#asso.name] #asso.from • #asso.to \
         
         
         #set text(
          size: eval(settings.font.size.description),
          font: settings.font.general
        )
         #h(0.8em) #asso.description \ #asso.description2

         
        ]
      ]
    }

]}


#let mainSection = {[
  #par[
    #set text(
      size: eval(settings.font.size.heading_huge),
      font: settings.font.general,
    )
    *#configuration.contacts.name*
  ]

  #par[
    #set text(
      size: eval(settings.font.size.heading),
      font: settings.font.minor_highlight,
      top-edge: 0pt
    )  
    #configuration.contacts.title
  ]

  = EXPÉRIENCE PROFESSIONNELLE

  #{
    for job in configuration.jobs [
      #par(justify: false)[
        #set text(
          size: eval(settings.font.size.heading),
          font: settings.font.general
        )
          #job.from – #job.to \
          *#job.position*
          #link(job.company.link)[\@  #job.company.name]
      ]
      #par(
        justify: false,
        leading: eval(settings.paragraph.leading)
      )[
        #set text(
          size: eval(settings.font.size.description),
          font: settings.font.general
        )
        #{
          for point in job.description [
            #h(0.8em) • #point \
          ]
        }
      ]
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight
        )
        #{
          let tag_line = job.tags.join(" • ")
          tag_line
        }
      ]
    ]
  }

  = PARCOURS SCOLAIRE

  #for place in configuration.education [
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
            #place.university.from – #place.university.to \
            #place.university.where \
            #link(place.university.link)[#place.university.name]
        ]

        
        #par[
          #set text(
            eval(settings.font.size.education_description),
            font: settings.font.minor_highlight,
          )

          #if place.university.degree != "#None" {[
            #place.university.degree\
          ]}
          #if place.university.major != "#None" {[
            #place.university.major\
          ]}
          #if place.university.track != "#None" {[
            #place.university.track\
          ]}

          #if place.university.cycleInter != "#NONE" [
          *Cycle international :* \
          #h(0.8em)#place.university.cycleInter.from - #place.university.cycleInter.to \
          #h(0.8em)#place.university.cycleInter.name \
          #h(0.8em)#place.university.cycleInter.where
        ]
      ]
      #if place.university.codeProjects != "#NONE" [
        
      
      *Projets*\
      #for project in place.university.codeProjects [
        #par[
          #set text(
            size: eval(settings.font.size.heading_tiny),
            font: settings.font.general
          )

          #if project.codeProject.to == "#NONE" [
            #h(0.8em) #project.codeProject.name • #project.codeProject.from \
            
          ] else [
            #h(0.8em) #project.codeProject.name • #project.codeProject.from - #project.codeProject.to \
          ]
        ]

        #par[
          #set text(
            eval(settings.font.size.education_description),
            font: settings.font.minor_highlight,
          )

          #project.codeProject.description
        ]

        #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight
        )
        #{
          let tag_line = project.codeProject.tags.join(" • ")
          tag_line
        }
      ]
    ]
  ]
        
    ]
  
]}

#grid(
    columns: (2fr, 5fr),
    column-gutter: 2em,
    sidebarSection,
    mainSection,
  )
