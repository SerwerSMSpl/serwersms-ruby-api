module SerwerSMS
  module ResourcesMixin
    def messages
      @messages ||= SerwerSMS::Resources::Messages.new(self)
    end

    def accounts
      @accounts ||= SerwerSMS::Resources::Accounts.new(self)
    end

    def blacklist
      @blacklist ||= SerwerSMS::Resources::Blacklist.new(self)
    end

    def contacts
      @contacts ||= SerwerSMS::Resources::Contacts.new(self)
    end

    def error
      @error ||= SerwerSMS::Resources::Error.new(self)
    end

    def files
      @files ||= SerwerSMS::Resources::Files.new(self)
    end

    def groups
      @groups ||= SerwerSMS::Resources::Groups.new(self)
    end

    def phones
      @phones ||= SerwerSMS::Resources::Phones.new(self)
    end

    def premium
      @premium ||= SerwerSMS::Resources::Premium.new(self)
    end

    def senders
      @senders ||= SerwerSMS::Resources::Senders.new(self)
    end

    def stats
      @stats ||= SerwerSMS::Resources::Stats.new(self)
    end

    def subaccounts
      @subaccounts ||= SerwerSMS::Resources::Subaccounts.new(self)
    end

    def templates
      @templates ||= SerwerSMS::Resources::Templates.new(self)
    end
  end
end
