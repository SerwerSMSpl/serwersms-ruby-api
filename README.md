# SerwerSMS - Ruby

Klient Ruby do komunikacji zdalnej z API v2 SerwerSMS.pl

## Wymagania

- Ruby >= 4.0
- Bundler >= 4.0

## Instalacja

```ruby
gem install serwersms
```

Lub w `Gemfile`:

```ruby
gem 'serwersms'
```

## Konfiguracja

Zalecane jest, aby komunikacja przez HTTPS API odbywała się za pomocą tokenu utworzonego specjalnie do połączenia z API.
Token API można wygenerować w Panelu Klienta → Ustawienia interfejsów → HTTP API → Tokeny API.
Opcjonalnie można użyć konta użytkownika API, które można utworzyć w Panelu Klienta → Ustawienia interfejsów → HTTP API → Użytkownicy API.

### Przez zmienne środowiskowe

```bash
# Opcja 1 - autentykacja przez token (zalecana)
SERWERSMS_TOKEN=twoj_token

# Opcja 2 - autentykacja przez login i hasło
SERWERSMS_USERNAME=twoj_login
SERWERSMS_PASSWORD=twoje_haslo

# Opcjonalne
# SERWERSMS_API_URL=https://api2.serwersms.pl
# SERWERSMS_TIMEOUT=30
```

### Uruchomienie

```ruby
require 'serwersms'

client = SerwerSMS::ClientFactory.from_env
```

### Przez plik YAML

```yaml
# config/serwersms.yml

# Opcja 1 - autentykacja przez token (zalecana)
serwersms_token: 'twoj_token'

# Opcja 2 - autentykacja przez login i hasło
# serwersms_username: 'twoj_login'
# serwersms_password: 'twoje_haslo'

# Opcjonalne
# serwersms_api_url: 'https://api2.serwersms.pl'
# serwersms_timeout: 30
```

### Uruchomienie

```ruby
require 'serwersms'

client = SerwerSMS::ClientFactory.from_yaml('config/serwersms.yml')
```

### Uruchomienie bezpośrednie

```ruby
require 'serwersms'

# przez token (zalecana)
client = SerwerSMS::ClientToken.new(token: 'twoj_token')

# przez login i hasło
client = SerwerSMS::ClientCredentials.new(user: 'twoj_login', password: 'twoje_haslo')
```

## Użycie

### Wysyłka SMS

```ruby
# SMS FULL (z nazwą nadawcy)
client.messages.send_sms('500600700', 'Treść wiadomości', 'INFORMACJA', { 'details' => true })

# SMS ECO (bez nadawcy)
client.messages.send_sms('500600700', 'Treść wiadomości', nil, { 'details' => true })

# Tryb testowy
client.messages.send_sms('500600700', 'Treść wiadomości', 'INFORMACJA', { 'test' => true })
```

### Wysyłka spersonalizowanych SMS

```ruby
messages = [
  { 'phone' => '500600700', 'text' => 'Cześć Jan' },
  { 'phone' => '500600701', 'text' => 'Cześć Anna' },
]

client.messages.send_personalized(messages, 'INFORMACJA', { 'details' => true })
```

### Wysyłka Voice

```ruby
client.messages.send_voice('500600700', { 'text' => 'Przykładowy tekst', 'details' => true })
```

### Wysyłka MMS

```ruby
client.messages.send_mms('500600700', 'Tytuł MMS', { 'file_id' => '1f9e980e87', 'details' => true })
```

### Raporty doręczeń

```ruby
client.messages.reports({ 'id' => '78f8bd0d55' })
```

### Wiadomości przychodzące

```ruby
client.messages.received('eco', { 'phone' => '500000001' })
```

### Obsługa błędów

```ruby
begin
  client.messages.send_sms('500600700', 'Treść', 'INFORMACJA')
rescue SerwerSMS::Error => e
  puts "[#{e.code}] #{e.message}"
end
```

## Dokumentacja API

https://dev.serwersms.pl
