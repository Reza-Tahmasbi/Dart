enum Months{
    Farvardin,
    Ordibehesht,
    Khordad,
    Tir,
    Mordad,
    Shahrivar,
    Dey,
    Bahman,
    Esfand,
    Mehr,
    Aban,
    Azar;

    String get dayCount {
        switch (this){
            case Months.Farvardin:
                return '31';
            case Months.Ordibehesht:
                return '31';
            case Months.Khordad:
                return '31';
            case Months.Tir:
                return '31';
            case Months.Mordad:
                return '31';
            case Months.Shahrivar:
                return '31';
            case Months.Mehr:
                return '30';
            case Months.Aban:
                return '30';
            case Months.Azar:
                return '30';
            case Months.Dey:
                return '30';
            case Months.Bahman:
                return '30';
            case Months.Esfand:
                return '29';    
            default:
                return 'Invalid month name';
        }
    }

    String get name {
        switch (this){
            case Months.Farvardin:
                return 'فروردین';
            case Months.Ordibehesht:
                return 'اردیبهشت';
            case Months.Khordad:
                return 'خرداد';
            case Months.Tir:
                return 'تیر';
            case Months.Mordad:
                return 'مرداد';
            case Months.Shahrivar:
                return 'شهریور';
            case Months.Mehr:
                return 'مهر';
            case Months.Aban:
                return 'آبان';
            case Months.Azar:
                return 'آذر';
            case Months.Dey:
                return 'دی';
            case Months.Bahman:
                return 'بهمن';
            case Months.Esfand:
                return 'اسفند';    
            default:
                return 'Invalid month name';
        }
    }
}
void main() {
  Months month = Months.Ordibehesht;
  print('Month: ${month.name}');
  print('Days: ${month.dayCount}'); 
}