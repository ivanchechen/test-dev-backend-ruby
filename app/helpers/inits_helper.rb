module InitsHelper
    def format_date(date)
        # formata data: 09h25 - 24/10/19
        return date.strftime("%Hh%M - %d/%m/%y")
      end 
end
