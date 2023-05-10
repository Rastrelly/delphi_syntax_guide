//тип файлу та його назва
//це МОДУЛЬ
//модуль за дизайном це сховище для підпрограм та типізації
//основний код проєкту як саме програми
//можна переглянути через меню Project -> View Project Source
unit usyntguide;

{$mode objfpc}{$H+}

//інтерфейсна частина
interface

//підключення зовнішніх модулів
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;


//об'явлення нових типів
type

  { TForm1 }
  //об'явлення типу нашої форми
  TForm1 = class(TForm)
    //перелік компонентів на формі
    btnGeneralStuff: TButton;
    btnArrays: TButton;
    btnSubprograms: TButton;
    chbBoxFunc: TCheckBox;
    edProcName: TEdit;
    Label1: TLabel;
    memoData: TMemo;
    //перелік обробників для компонентів
    procedure btnArraysClick(Sender: TObject);
    procedure btnGeneralStuffClick(Sender: TObject);
    procedure btnSubprogramsClick(Sender: TObject);
  private

  public

  end;

//попередні декларації підпрограм
// підпрограми бувають двох типів:
// а. ПРОЦЕДУРИ
// Нічого не повертають. Аналог void
// функцій з C++
procedure procedure_name(att1:integer;att2,att3:real; var att4:string);
//у переліку параметрів процедур та функцій ті, що
//поміщено з ключовим словом var будуть впливати на змінну,
//якщо та вказана як параметр при виклику процедури або функції

// б. ФУНКЦІЇ
// Повертають значення певного типу, яке вказується після імені функції
function function_name(att1:integer;att2,att3:real; var att4:string):boolean;
//дана функція як приклад повертає тип boolean

//це попередні декларації. процедури та функції реалізуються у розділі
//implementation (див.)


var
  //об'явлення об'єкту форми як змінної
  Form1: TForm1;

  //основні типи даних та об'явлення змінних
  vInt:integer; //цілі числа
  vStr:string; //рядок тексту
  vChr:char;   //один символ
  vRel:real;   //число з плаваючою точкою (дріб)
               //також відомі як float
  vDbl:double; //float подвійної точності
  bBoo:boolean;//бінарний тип, має значення
               //true або false (bool)

  vByt:byte;   //однобайтовий integer

  //масиви
  //це рядки однотипних значень, проіндексовані певним чином
  //масиви бувають:
  //1. статичні
  // - мають фіксовану незмінювану довжину
  // - мають (у Delphi) довілбну індексацію
  iArrStatic:array [0 .. 9] of integer;
  sArrStatic:array [1 .. 5] of string;

  //2. динамічні
  // - довжина може змінюватись процедурою SetLength (див.)
  // - індексуються виключно від нуля
  // - індекс останнього елементу дорівнює довжині мінус один
  fArrDynamic:array of real;

implementation
//це директива компілятора яка налаштовує режим ресурсних файлів; не чіпаємо
{$R *.lfm}

//пишемо імплементації наших підпрограм
procedure procedure_name(att1:integer;att2,att3:real; var att4:string);
var a:integer; //внутрішні змінні
  //об'явлені у цьому блоці існують
  //виключно для даної підпрограми
begin
  //процедура нічого нікому не повертає,
  //тож їх використовують для виконання
  //певних стандартних послідовностей дій
  //дані з процедури виводяться через параметри-
  //посилання з приставкою var
  a:=att1 + round(att2 / att3);
  att4 := IntToStr(a);
  //для перетворення типів використовують відповідні функції та процедури
  //Integer - > String  -   IntToStr
  //Real    - > String  - FloatToStr
  //Boolean - > String  -  BoolToStr
  //String  - > Integer -   StrToInt
  //String  - > Real    -   StrToFloat
  //String  - > Boolean -   StrToBool
end;

function function_name(att1:integer;att2,att3:real; var att4:string):boolean;
begin
  //функція завжди повертає певне значення
  //цим значенням є значення, записане у
  //внутрішню змінну result у момент, коли підпрограма завершує
  //виконання
  result:=true;
end;
//виклик підрограм див. нижче

//після наступного коментаря зазвичай розміщують
//обробники подій та методи класу форми
// (все, що починається з TForm...)
{ TForm1 }

procedure TForm1.btnGeneralStuffClick(Sender: TObject);
var ia,ib,ic:integer;
    sa,sb,sc:string;
    fa,fb,fc:real;
    ba, bb, bc, bd, be, bf:boolean;
    bRes:boolean;

    i:integer;
begin

  //основні операції
  //присвоювання
  ia := 10;
  ib := 5;
  ic := 0;

  fa := 10.1;
  fb := 12.8;
  fc := 0.0;

  sa := 'First';
  sb := 'Second';
  sc := '';

  //складання
  fc := fa + fb; //fc = 22.9
  ic := ia + ib; //ic = 15
  sc := sa + sb; //sc = 'FirstSecond' - конкатенація

  //віднімання
  fc := fa - fb;
  ic := ia - ib;

  //множення
  fc := fa * fb;
  ic := ia * ib;

  //ділення
  fc := fa / fb;
  ic := round(ia / ib); //не можна ділити цілі числа і записувати у int
  fc := ia / ib;        //ділення повртає значення типу real

  //знаходження основної частини від ділення
  ic := ia div ib; //10 div 3 = 3

  //знаходження залишку від ділення
  ic := ia mod ib; // 5 mod 2 = 5

  //прирощування значень
  ia := 10;
  ia := ia + 5; //ia = 15
  ia := ia - 10;//ia = 5

  //альтернативно виключно для int
  ia:=10;
  inc(ia,5); //ia = 15
  inc(ia);   //ia = 16

  //Логічні оператори
  // 1 - математичні логічні оператори
  //     повертають boolean
  ia := 10;
  ib := 5;

  bRes:= ia < ib; //bRes = false
  bRes:= ia <= ib;//bRes = false
  bRes:= ia > ib; //bRes = true
  bRes:= ia >= ib;//bRes = true
  bRes:= ia = ib; //bRes = false
  //так можно перевіряти числа (int, float) та рядки

  // 2 - логічні оператори
  ba:=true; bb:=false; bc:=true;

  bc := ba and bb;
  {
  bc    ba     bb
  TRUE  TRUE   TRUE
  FALSE TRUE   FALSE
  FALSE FALSE  TRUE
  FALSE FALSE  FALSE
  }

  bc:= ba or bb;
  {
  bc    ba     bb
  TRUE  TRUE   TRUE
  TRUE  TRUE   FALSE
  TRUE  FALSE  TRUE
  FALSE FALSE  FALSE
  }

  bc:= ba xor bb;
  {
  bc    ba     bb
  FALSE TRUE   TRUE
  TRUE  TRUE   FALSE
  TRUE  FALSE  TRUE
  FALSE FALSE  FALSE
  }

  bc := not ba;
  {
  bc     ba
  FALSE  TRUE
  TRUE   FALSE
  }

  //3 - комбіновані лоігчні оператори
  //логічні оператори можуть комбінуватись
  ba:=true; bb:=false; bd:=true; be:=true;

  bc := (ba and bb) or (bd and be);
  //дії в дужках завжди рахують першими
  //логіка:
  // (1) ba and bb = false
  // (2) bd and be = true
  // (1) or (2) = false or true = true
  //таким чином bc = true

  //для будь-якого логічного виразу може бути
  //сформована логічна таблиця
  {
  bc      ba      bb      bd      be
  TRUE    TRUE    TRUE    TRUE    TRUE
  TRUE    FALSE   TRUE    TRUE    TRUE
  TRUE    TRUE    FALSE   TRUE    TRUE
  TRUE    FALSE   FALSE   TRUE    TRUE
  TRUE    TRUE    TRUE    FALSE   TRUE
  TRUE    TRUE    TRUE    TRUE    FALSE
  TRUE    TRUE    TRUE    FALSE   FALSE
  FALSE   FALSE   TRUE    FALSE   TRUE
  FALSE   TRUE    FALSE   TRUE    FALSE
  FALSE   TRUE    FALSE   FALSE   TRUE
  FALSE   FALSE   TRUE    TRUE    FALSE
  FALSE   FALSE   FALSE   FALSE   TRUE
  FALSE   FALSE   FALSE   TRUE    FALSE
  FALSE   FALSE   TRUE    FALSE   FALSE
  FALSE   TRUE    FALSE   FALSE   FALSE
  FALSE   FALSE   FALSE   FALSE   FALSE
  }

  //РОЗГАЛУЖЕННЯ
  //розгалуження забезпечують нелінійність алгоритму
  //на основі аналізу логічних виразів у явній
  //ябо неявній формі

  //1) просте розгалуження
  ba := true;
  if (ba = true) then
  begin
    //зробити якщо ba = TRUE
  end //перед else крапка з комою НЕ СТАВИТЬСЯ
  else
  begin
    //зробити якщо ba = FALSE
  end;

  //в умові розгалуження може знаходитись будь-який
  //логічний вираз або логічне значення, тож
  if ba then begin end; //є коректним оператором
  //розгалуження. також в якості умови може виступати
  //будь-який комбінований вираз:
  if ((ia > ib) or (fc = fa)) then begin end;

  //зверніть увагу: блок ELSE не є обов'язковим
  //якщо ELSE немяє, оператор просто не виконає жодних
  //дій, якщо умова не виконується

  //2) розгалуження за перемикачем
  // у якості перемикача (ідексного значення)
  // зазвичай виступає тип int
  case ia of
  0:begin
    //що робити якщо ia = 0
    end;
  1:begin
    //що робити якщо ia = 1
    end;
  2:begin
    //що робити якщо ia = 2
    end;
  //і так далі
  else
    begin
    //що робити, якщо жоден з варіантів не спрацьовує
    end;
  end;

  //3) циклічне розгалуження
  //цикли змушують певні дії повторюватись доти, доки виконується
  //(або НЕ виконується) певна умова

  //3.1) Цикл з лічильником
  // цикл виконується для діапазону значень змінної-лічильника.
  // традиційно лічильник - це змінная під назвою i

  for i:=0 to 10 do
  begin
    //операції циклу
  end;

  //даний цикл виконається для значень i = 0, i = 1,
  //i = 2, ..., i = 10. Значення i завжди збільшується на 1

  //Якщо треба зменшувати значення, існує цикл
  for i:=10 downto 0 do
  begin
    //операції циклу
  end;
  //даний цикл виконається для значень i = 10, i = 9,
  //i = 8, ..., i = 0. Значення i завжди зменшується на 1

  //в якості лічильника завжди виступає int

  //3.2) цикл з передумовою
  // на кожній ітерації цикл перевіряє булеву умову. якщо
  //вона не виконується, нова ітерація циклу не починається

  while ia<5 do
  begin
    //операції циклу
  end;
  //якщо умова виконується завжди, програма, очевидно, зависне

  //цикл з постумовою також може не виконатись жодного разу, якщо умова
  //початково не виконується

  //3.3) цикл з постумовою
  // в кінці кожної ітерації цикл перевіряє булеву умову. якщо вона ВИКОНУЄТЬСЯ,
  //цикл буде завершено. Одна ітерація цикла з постумовою буде виконана завжди

  repeat
    //операції циклу
  until (ia >= 5);

end;

procedure TForm1.btnArraysClick(Sender: TObject);
var i,ia,il,ih,iArrL:integer;
    iArrSExample:array[1..10]of integer;
    fArrVal:real;
    charSym:char;
    sLine:string;
begin
  //до елементу масиву необхідно звертатись як до
  // змінної того ж типу що й масив за індексом
  i:=5;
  ia := iArrSExample[i];
  //перед використанням масиву завжди слід присвоїти його членам певні значення
  for i:=1 to 10 do iArrSExample[i]:=0;
  //це називається ініціалізація нулями

  //звернення до елементу масиву поза межами
  //його індексації є помилкою
  ia := iArrSExample[12];

  //діапазон значень масиву завжди можна визначити за допомогою фкнкцій
  //High та Low
  il:=Low(iArrSExample);  //найменший індекс елементу
  ih:=High(iArrSExample); //найбільший індекс елементу

  //змінна типу string є масивом символів (char)
  sLine:='This is a line';
  charSym:=sLine[5];

  //довжину рядка або масиву завжди можна отримати
  //за функцією length()
  iArrL:=length(iArrSExample);

  //нульовий член рядка завжли є недоступним (у Delphi)
  //проте рядок є по суті динамічним масивом і його
  //довжину можна регулювати, як і для динамічного масиву, процедурою
  //SetLength
  SetLength(sLine,20); //рядок 1..20
  SetLength(fArrDynamic, 100); //масив 1..99

  //дані в масиві можна обробляти циклом перебору (т.з. for each loop)
  for fArrVal in fArrDynamic do
  begin
    //в тілі циклу fArrVal буде послідовно
    //приймати значення КОЖНОГО елементу масиву
    //fArrDynamic

    //ця версія циклу for не має лічильника
    //тоже значення індексу поточного елементу
    //слід розраховувати самостійно
  end;

  //масиви можуть містити дагі будь-якого типу:
  //від змінних та показчиків до об'єктів створени
  //класів, тож вони є незамінним інструментом
  //при робті з динамічними наборами об'єктів

  //очистити динамічний масив можна вказавши йому довжину 0
  SetLength(fArrDynamic,0);

  //збільшити або зменшити довжину можна комбінацією
  //функції Length() та процедури SetLength()
  SetLength(fArrDynamic,Length(fArrDynamic)+1);
end;

procedure TForm1.btnSubprogramsClick(Sender: TObject);
var iV1: integer;
    fV1, fV2: real;
    sV1: string;
    bV1: boolean;
begin
  //підпрограми викликаються за їх іменем (ідентифікатором)
  //з вказанням значень або змінниз відповідних
  //типів у якості параметрів
  iV1:=10;
  fV1:=20.3;
  fV2:=13.1;
  sV1:='Test';
  bV1:=false;

  //викликаємо нашу процедуру
  procedure_name(iV1,fV1,fV2,sV1);
  //після виконання цієї процедури, значення sV1
  //зміниттся на обчислене. Можемо вивести його до тестоового поля
  //edProcName:
  edProcName.Text:=sV1;

  //функція повертає певне значення, тож її
  //результат виконання як правило присвоюється
  //змінній або властивості:
  bV1:=function_name(iV1,fV1,fV2,sV1);
  //функція в нас пуста, тож вона просто поверне значення
  //true як ми і вказали. Щоб переконатись, що це працює,
  //присвоїмо результат чекбоксу chbBoxFunc:
  chbBoxFunc.Checked:=true;
  //зверніть увагу: доступ до компонентів на формі ми маємо
  //через те, що працюємо з процедурами-обробниками подій,
  //які всі є методами-членами об'єкту класу TForm1
end;


end.

