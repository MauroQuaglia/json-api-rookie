# RSpec API Doc Generator
* E' un po' problematica l'installazione di questa gemma e attualmente richiede alcuni fix.

* Bisogna fissare la versione di `rack` alla `3.0.11`.
* Non bisogna prenderla da RubyGems ma direttamente dal repository di GitHub: `https://github.com/zipmark/rspec_api_documentation.git`.
* Inoltre bisogna aggiungere il fix fatto in `spec/acceptance_helper.rb` relativo al `response_body_formatter` per evitare un problema legato al `[binary data]`.
* Se tolgo anche solo una di queste cose il tutto non funziona correttamente.
* Ho lasciato tutto commentato nel codice
* Riporto comunque la issue [binary data](https://github.com/zipmark/rspec_api_documentation/issues/456)

# Alcuni riferimenti
* [rubygems](https://rubygems.org/gems/rspec_api_documentation/versions/6.1.0)
* [rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation/tree/master)