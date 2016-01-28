# SerwerSMS - Ruby

Klient Ruby do komunikacji zdalnej z API v2 SerwerSMS.pl

Instalacja
```ruby
    gem install serwersms
```

Zalecane jest, aby komunikacja przez HTTPS API odbywała się z loginów utworzonych specjalnie do połączenia przez API. Konto użytkownika API można utworzyć w Panelu Klienta → Ustawienia interfejsów → HTTPS XML API → Użytkownicy.

Przykładowe wywołanie
```ruby
        require('serwersms')

        begin
          s = Serwersms.new('username','passwd')
          
          params = { details: true, test: 1 }
          puts s.templates.delete("12243") 

        rescue Exception=>e
          puts e.message
        end
```
Wysyłka SMS
```ruby
        begin
            s = Serwersms.new('username','passwd')
          
            params = { details: true }
          
            # SMS FULL
          
            puts s.messages.sendSms('500600700','text','Informacja',params)
          
            # SMS ECO
          
            puts s.messages.sendSms('500600700','text',nil,params)
          
            # VOICE from text   
          
            params['text'] = 'przykladowy tekst'
            puts s.messages.sendVoice('500600700',params)
            
            # MMS
            
            params['file_id'] = '1f9e980e87'
            puts s.messages.sendMms('500600700','tresc',params)
              
        rescue Exception=>e
          puts e.message
        end
```        
Wysyłka spersonalizowanych SMS
```ruby
    begin
         s = Serwersms.new('username','passwd')
          
        params = { details: true }
        messages = '500600700:test]|[500600701:test1]|[500600702:test3';
        
        puts s.messages.sendPersonalized(messages,nil,params)
          
    rescue Exception=>e
      puts e.message
    end
    
```
Pobieranie raportów doręczeń
```ruby

    begin
        s = Serwersms.new('username','passwd')
        
        params = { details: true }  
        params['id'] = '78f8bd0d55'
        
        puts s.messages.reports(params)
          
    rescue Exception=>e
      puts e.message
    end
```
Pobieranie wiadomości przychodzących
```ruby

    begin
        s = Serwersms.new('username','passwd')
        
        params = { details: true }  
        params['phone'] = '500000001'
        
        puts s.messages.recived('full',params)

    rescue Exception=>e
      puts e.message
    end
```
## Wymagania

ruby ver. 1.9

## Dokumentacja
http://dev.serwersms.pl