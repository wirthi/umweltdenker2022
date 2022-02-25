# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

group_lvooe = Group.create!(name: "Landesverband Oberösterreich", lat: "1234", lon: "4567")
Group.create!(name: "4222", lat: "1234", lon: "4567")
Group.create!(name: "Bad Ischl", lat: "1234", lon: "4567")
Group.create!(name: "Bad Goisern", lat: "1234", lon: "4567")
Group.create!(name: "Braunau am Inn", lat: "1234", lon: "4567")
Group.create!(name: "Brunnenthal", lat: "1234", lon: "4567")
Group.create!(name: "Enns", lat: "1234", lon: "4567")
Group.create!(name: "Freistadt", lat: "1234", lon: "4567")
Group.create!(name: "Gallneukirchen-Engerwitzdorf", lat: "1234", lon: "4567")
Group.create!(name: "Gmunden", lat: "1234", lon: "4567")
Group.create!(name: "Hörsching", lat: "1234", lon: "4567")
Group.create!(name: "Kremstal", lat: "1234", lon: "4567")
Group.create!(name: "Kronstorf", lat: "1234", lon: "4567")
group_lhf = Group.create!(name: "Langholzfeld", lat: "1234", lon: "4567")
Group.create!(name: "Leonding", lat: "1234", lon: "4567")
Group.create!(name: "Linz 2", lat: "1234", lon: "4567")
Group.create!(name: "Linz 4", lat: "1234", lon: "4567")
Group.create!(name: "Linz 5", lat: "1234", lon: "4567")
Group.create!(name: "Linz 6", lat: "1234", lon: "4567")
Group.create!(name: "Linz 8 - Ebelsberg-Pichling", lat: "1234", lon: "4567")
Group.create!(name: "Linz 12", lat: "1234", lon: "4567")
Group.create!(name: "Steyrtal", lat: "1234", lon: "4567")
Group.create!(name: "Nöstlbach", lat: "1234", lon: "4567")
Group.create!(name: "Ottensheim", lat: "1234", lon: "4567")
Group.create!(name: "Pregarten", lat: "1234", lon: "4567")
Group.create!(name: "Puchenau", lat: "1234", lon: "4567")
Group.create!(name: "Regau", lat: "1234", lon: "4567")
Group.create!(name: "Ried im Innkreis", lat: "1234", lon: "4567")
Group.create!(name: "Rohrbach", lat: "1234", lon: "4567")
Group.create!(name: "Schildorn", lat: "1234", lon: "4567")
Group.create!(name: "Sauwald", lat: "1234", lon: "4567")
Group.create!(name: "Steyr 1", lat: "1234", lon: "4567")
Group.create!(name: "Schwanenstadt", lat: "1234", lon: "4567")
Group.create!(name: "Traun-Oedt", lat: "1234", lon: "4567")
Group.create!(name: "Vöcklabruck", lat: "1234", lon: "4567")
Group.create!(name: "Vöcklamarkt", lat: "1234", lon: "4567")
Group.create!(name: "Vorchdorf", lat: "1234", lon: "4567")
Group.create!(name: "Wels", lat: "1234", lon: "4567")

# Create a main sample user.
User.create!(firstname: "Christian ADMIN",
        name: "Wirth",
        email: "wirthi@gmx.at",
        password: "clancy26",
        password_confirmation: "clancy26",
        admin: true,
        activated: true,
        activated_at: Time.zone.now,
        group_id: group_lvooe.id)

User.create!(firstname: "Christian Wirth",
        name: "Wirth",
        email: "cw@cwirth.at",
        password: "clancy26",
        password_confirmation: "clancy26",
        admin: false,
        activated: true,
        activated_at: Time.zone.now,
        group_id: group_lhf.id)

#15.times do |n|
#  firstname = Faker::Name.first_name
#  name = Faker::Name.last_name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  User.create!(name: name,
#          firstname: firstname,
#          email: email,
#          password: password,
#          password_confirmation: password,
#          activated: true,
#          activated_at: Time.zone.now,
#          group_id: group_lhf.id)
#end

abfall = Category.create!(title: "Abfall",
  unit: "Kilogramm",
  unit_short: "kg",
  title_en: "waste")
energie = Category.create!(title: "Energie",
  unit: "Kilowattstunden",
  unit_short: "kWh",
  title_en: "energy")
ernaehrung = Category.create!(title: "Ernährung",
  unit: "Kilogramm Kohlendioxid",
  unit_short: "kg CO2",
  title_en: "food")
verkehr = Category.create!(title: "Verkehr",
  unit: "Kilometer",
  unit_short: "km",
  title_en: "traffic")
wasser = Category.create!(title: "Wasser",
  unit: "Liter",
  unit_short: "l",
  title_en: "water")

# Generate Contributions for a subset of users in DEVELOPMENT
if Rails.env.development?
  users = User.order(:created_at).take(6)
  15.times do
    content = Faker::Lorem.sentence(word_count: 5)
    title = Faker::Lorem.sentence(word_count: 2)
    users.each { |user| user.contributions.create!(
      title: title,
      content: content,
      category: abfall,
      amount: 42,
      completion: "31.12.2022") }
  end
end

# == Challenges Abfall ==
Challenge.create(title: "Eins-reicht-Challenge",
  description: "Hygiene ist wichtig. Zum Abtrocknen der Hände mit Papierhandtüchern reicht aber häufig ein einziges Blatt. Probier es aus. Wie viele Kilogramm Papier kannst du dadurch einsparen?<br/><br/>Hygienepapier wird nicht recyclet.<br/><br/><strong>Hinweis zur Berechnung</strong>: Pro Blatt Papier sind es etwa 2,14g also 0,00214kg. ",
  submission: "Stelle in einer Woche fest wie viele Blatt Papierhandtücher du benötigst. In der nächsten Woche versuche mit weniger Blättern auszukommen. Wie viele Blätter hast du im Vergleich zur Vorwoche gespart. Rechen die Anzahl an gesparten Blättern in Kilogramm um. Ja, das wirkt auf den ersten Blick vielleicht nicht so viel, aber wenn das viele machen, kommt doch eine ganz schöne Menge heraus.",
  category: abfall)
  
Challenge.create(title: "Pick-and-Collect-Challenge",
  description: "Müll gehört in den Mülleimer, am besten recycelt. Doch immer wieder finden wir Müll entlang des Weges oder in der Natur. Sammle den Müll ein und entsorge ihn sachgerecht.",
  submission: "Führe eine Müllsammelaktion durch bei der du am besten gemeinsam mit anderen die Natur vom Müll befreit und diesen sachgerecht trennt und entsprechend entsorgt. Miss dabei wie viele Kilogramm von welcher Müllsorte ihr gesammelt habt. ",
  category: abfall)

Challenge.create(title: "Einpack-Challenge",
  description: "Weil es praktisch ist verwenden wir oft Frischhaltefolie oder Alufolie zum Verpacken von Lebensmitteln.  Diese sind aber nicht umweltverträglich. Informiere dich, wie du diese Folien ersetzen kannst (etwa durch Bienenwachstücher). Wie viele Meter Folie kannst du dadurch sparen? <br/><br/><strong>Hinweis zur Berechnung</strong>: Wenn du ein 15cm langes Stück einer Rolle Alufolie verwendest hat das in etwa 1g also 0,001kg. Bei Frischhaltefolie haben 2 Meter ungefähr 4g, also für 10cm sind das etwa 0,2g oder 0,0002kg. ",
  submission: "Nimm dir eine Woche Zeit um zu messen, wie viel Alufolie oder Frischhaltefolie du für die Jause oder die Aufbewahrung von Lebensmitteln verwendest, oder wie viel in eurem Haushalt verwendet wird. In der nächsten Woche, versuch die Folie durch umweltfreundliche Alternativen zu ersetzen. Berechne die Differenz aus den beiden Wochen und rechne die Einsparung in Kilogramm um. Ja das erscheint auf den ersten Blick nicht so viel, aber Alufolie verbraucht viel Energie in der Herstellung und wenn viele Menschen Folie sparen, ist es ein signifikanter Beitrag für den Umweltschutz.",
  category: abfall)
  
# == Challenges Energie ==
Challenge.create(title: "Ausschalten-und-Ausstrecken-Challenge",
  description: "WLAN gehört mittlerweile zum Alltag. Aber brauchen wir es tatsächlich Tag und Nacht? <br/><br/>Schalte doch deinen Router und andere Gerät, die du für einige Zeit nicht brauchst ab und Stecke Ladegeräte aus, wenn kein Gerät dran hängt. Lade dein Handy nur so lange, bis der Akku voll ist und daher nicht über Nacht auf.<br/><br/><strong>Hinweis zur Berechnung</strong>: ",
  submission: "Überlege dir welche Geräte bei dir zu Hause unnötig auf Standby geschalten sind, oder Angesteckt sind, obwohl das nicht notwendig ist. Stelle fest für wie viele Stunden pro Tag das der Fall ist. Stecke sie dann aus und berechne anhand der Tabelle wie viele kWh du in einer Woche sparen konntest. ",
  category: energie)

Challenge.create(title: "Earth-Hour-Challenge",
  description: "Nimm an der Earth-Hour teil. Bei dieser Aktion schalten Menschen auf der ganzen Welt zum Zeichen, dass ihnen Umweltschutz ein Anliegen ist, für eine Stunde alle Lichter und elektrischen Geräte aus.<br/><br/>Heuer findet die Earth Hour am 26. März von 20:30-21:30 Uhr statt.<br/><br/><a href=\"https://www.earthhour.org\">earthhour.org</a><br/><br/><strong>Hinweis zur Berechnung</strong>: ",
  submission: "telle fest, welche Geräte und Lampen bei dir zu Hause üblicherweise am Abend eingeschalten sind. Nimm an der Earth Hour teil und schalte für eine Stunde all diese Geräte ab. Nimm die Umrechnungstabelle zur Hand und berechne, wie viel du eingespart hast. ",
  category: energie)

Challenge.create(title: "Handy-Akku-Challenge",
  description: "Dein Handyakku hält länger, wenn du das Gerät weniger benutzt. Alle Apps, die laufen, brauchen auch Strom, wenn wir sie gerade nicht brauchen. Wie lange hält dein Handy-Akku normal. Um wie viele Stunden kannst du das mit geringer und bewusster Verwendung verlängern? <br/><br/><strong>Hinweis zur Berechnung</strong>: ",
  submission: "Miss in einer Woche, wie oft du dein Handy laden musst. Versuch in der nächsten Woche Akku zu sparen und miss wieder, wie oft du das Handy laden musst. Wie viele Ladevorgänge konntest du einsparen? Rechne die Anzahl an Ladevorgängen mit den Hinweisen zur Umrechnung in kWh um.",
  category: energie)

# == Challenges Wasser ==
Challenge.create(title: "Warmduscher-Challenge",
  description: "Spart man Wasser im Haushalt, schont das nicht nur die natürliche Ressource Wasser, die in vielen Regionen der Welt knapp ist. Es trägt auch zur Reduktion von CO²-Emissionen bei. Wie das geht? Ganz einfach: CO²-Emissionen resultieren zunächst aus der fossilen Energie, die eingesetzt wird, um das Wasser zu fördern, aufzubereiten und zu transportieren. Außerdem ist auch die Reinigung des Abwassers im Klärwerk mit dem Einsatz von Energie verbunden. Somit kann bereits zum Klimaschutz beigetragen werden, wenn der Verbrauch an kaltem Wasser reduziert wird. Noch viel relevanter im Hinblick auf den Energieverbrauch ist jedoch warmes Wasser dessen Bereitstellung allein rund 12 Prozent des Energieverbrauchs in privaten Haushalten verursacht. Erfolgt dies nicht unter Einsatz erneuerbarer Energieträger (<a href=\"https://www.co2online.de/modernisieren-und-bauen/heizung/brennstoffe-energietraeger-im-vergleich/\">Energieträger im Vergleich</a>), beispielsweise in einer Solarthermieanlage, so sind damit erhebliche CO2-Emissionen verbunden. Kaltduschen verursacht also deutlich weniger CO2-Emissionen als Warmduschen. Wie viel Warmwasser kannst du in einer Woche einsparen?<br/><br/><strong>Hinweis zur Berechnung</strong>: Bei Warmwasseraufbereitung mit Gas oder Fernwärme entsteht pro Liter Warmwasser 6 g CO2. Mit Strom sind es rund 19g CO2. ",
  submission: "Gib an, wie viele kg CO2 zu mit der Reduktion von Warm- und/oder Kaltwasser eingespart hast.",
  category: wasser)

Challenge.create(title: "Leitungswasser-Challenge",
  description: "um Glück leben wir in einem Land, in dem frisches Wasser direkt aus der Leitung kommt. Trotzdem steht das Mineralwasser hoch im Kurs. Wie steht es mit dir: Kannst du eine Woche auf dein Mineralwasser verzichten?",
  submission: "Beobachte, wieviel Liter Mineralwasser du in einer Woche trinkst. Nach der durchgestandenen Challenge gib uns bitte an, wieviele kg CO2 du eingespart hast (pro Liter Mineralwasser spart man 210g CO2).",
  category: wasser)

# == Challenges Ernährung ==
Challenge.create(title: "Tee-statt-Kaffee-Challenge",
  description: "Das ist Hardcore. Kannst du für eine gewisse Zeit auf deinen Kaffee verzichten? Kaffee erzeugt viermal so viel CO² wie Tee. Eine Tasse Kaffee schlägt sich immerhin mit ca. 100g CO² zu Buche. Bei 1.000 Tassen im Jahr, (also etwa drei am Tag) sind das 100 kg CO². Bei Tee kommen bloß 25 kg zusammen. Wie lange schaffst du es auf deinen Kaffee zu verzichten?",
  submission: "Rechne nach, wie viele Tassen Kaffee zu normalerweise trinkst.  Pro Tasse, auf die du anstelle von Kaffee, Tee trinkst, sparst du 75 g CO2 ein. Gib an, wie viele kg CO2 du nach einer Woche eingespart hast. ",
  category: ernaehrung)

Challenge.create(title: "Schweinefleisch-Challenge",
  description: "Österreich ohne Schnitzel? Never...oder doch? Wir Österreicher:innen verspeisen jede Woche durchschnittlich rund 0,70 kg Schweinefleisch, das verursacht 8,6 kg CO2 Emissionen. Das geht doch anders: Überlege, ob du mit deinem Schweinefleischverbrauch in Etwa beim Durschnitt liegst, wenn ja dann ist die Rechnung ganz einfach. Verzichte eine Woche auf Schweinefleisch und du sparst 8,6 kg CO2 Emissionen ein. ",
  submission: "Gib an, wieviel kg CO2 du eingespart hast.",
  category: ernaehrung)

Challenge.create(title: "Butter-Challenge",
  description: "Ein Marmeladebrot ohne Butter? Unvorstellbar...oder doch nicht? Butter ist vor allem wegen seiner aufwändigen und energieintensiven Herstellung klimaschädlich, Verpackung, Transport und Kühlkette geben noch ihres dazu. Weiters wird Butter aus Kuhmilch hergestellt und wie wir wissen ist Kuhhaltung einfach schlecht für unser Klima. Die Challende: Verzichte eine Woche auf deine Butter und hilf mit, das Klima zu retten. ",
  submission: "Gib an, wieviel kg Butter du im Vergleich zu einer herkömmlichen Woche eingespart hast (1kg Butter = 24 kg CO2-Einsparung)",
  category: ernaehrung)

Challenge.create(title: "Vegan/Vegetarisch-Challenge",
  description: "Für die Herstellung von einem Kilo Rindfleisch fallen 13,3 kg CO2 an. Die kann man leicht einsparen, wenn man die Tiere nicht mehr isst. Rinder haben eine besonders schlechte Klimabilanz, weil sie zudem ordentlich Methan ausstoßen. Methan ist wie Kohlendioxid ein Treibhausgas, es ist aber 25-mal schädlicher als CO². Und: Kühe fressen enorme Mengen Soja. Und für Soja wird der Regenwald abgeholzt. Wer also nicht ganz auf Fleisch verzichten will, der sollte am ehesten auf Rind verzichten und vielleicht ab und an Hühnchen essen. Mit der Grundsatzentscheidung für eine vegetarische oder vegane Ernährungsweise schaffst Du klare Verhältnisse, schaffst du es, dich eine Woche lang vegetarisch bzw. vegan zu ernähren?",
  submission: "Beobachte, an wie vielen Tagen du in einer normalen Woche Fleisch und Wurst konsumierst. Mit jedem Tag, an dem du dich im Vergleich dazu in deiner Challenge-Woche vegetarisch bzw. Vegan ernährst, sparst du 1,1kg CO2 (vegetarisch) bzw. 2,2 kg CO2 (vegan) ein. Gib an, wie viele kg CO2 du eingespart hast.",
  category: ernaehrung)

# == Challenges Verkehr ==

Challenge.create(title: "Keine-Auto-Challenge",
  description: "Der Autoverkehr ist einer der größten CO2-Verursacher. Versuche mal, für einige Zeit ohne Auto auszukommen, entweder als Selbstfahrer oder als Mitfahrer bei den Eltern. Geh zu Fuß oder nimm das Fahrrad auf dem Weg zur Schulde, zum Sport oder in die Heimstunde. Auch (Eltern-)Fahrgemeinschaften tragen dazu bei, CO² einzusparen. <br/><br/><strong>Hinweis zur Berechnung</strong>: ca. 125g C02-Ausstoß pro gefahrener Autokilometer.",
  submission: "Überlege dir, welche Wege du in einer gewöhnlichen Schuld- oder Arbeitswoche anstelle des Autos mit dem Rad, zu Fuß oder mit den Öffis zurücklegen kannst. Auch eine Fahrgemeinschaft spart Kilometer ein. Z.B. mit Google Maps lassen sich dann ganz leicht die KM eruieren, die du einsparen kannst. Gib an, wie viele kg CO2 du pro Woche eingespart hast. ",
  category: verkehr)

Challenge.create(title: "Sommerlager-Challenge",
  description: "Euer nächstes Sommerlager wird schon geplant? Dann versucht einmal den Lagerort so zu wählen, dass alle Teilnehmer mit den Öffis dorthin gelangen können. <br/><br/><strong>Hinweis zur Berechnung</strong>: ca. 125g C02-Ausstoß pro gefahrener Autokilometer.",
  submission: "Überlegt, wie  viele PKWs und sonstige Fahrzeuge üblicherweise für die Anreise zum Sommerlager benötigt werden, berechnet die Kilometer mit einer Straßenkarte und berechnet, wie viele kg CO2 ihr für dieses Sommerlager eingespart habt.",
  category: verkehr)

