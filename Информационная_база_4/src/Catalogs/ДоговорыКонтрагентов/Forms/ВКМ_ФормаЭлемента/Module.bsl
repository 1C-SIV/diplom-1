
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ВКМ_ДобавитьПоляВвода();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВКМ_ВидДоговораПриИзменении(Элемент)
	
	ЗначениеАбонентскаяПлата = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание");
	
	Если Объект.ВидДоговора = ЗначениеАбонентскаяПлата Тогда
		Элементы["ВКМ_ГруппаАбонентскаяПлата"].Видимость = Истина;
	Иначе 
		Элементы["ВКМ_ГруппаАбонентскаяПлата"].Видимость = Ложь;			
	КонецЕсли;	
		
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ВКМ_ДобавитьПоляВвода()

	ГруппаАбонентскаяПлата = Элементы.Добавить("ВКМ_ГруппаАбонентскаяПлата", Тип("ГруппаФормы"));
	ГруппаАбонентскаяПлата.Заголовок = "Реквизиты абонентской платы";
	ГруппаАбонентскаяПлата.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаАбонентскаяПлата.ОтображатьЗаголовок = Истина; 
	ГруппаАбонентскаяПлата.Группировка = ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;
	ГруппаАбонентскаяПлата.РастягиватьПоГоризонтали = ИСТИНА;
	ГруппаАбонентскаяПлата.Видимость = Ложь;
	
	ГруппаПериодДействияДоговора = Элементы.Добавить("ВКМ_ГруппаПериодДействияДоговора", Тип("ГруппаФормы"), ГруппаАбонентскаяПлата);	
	ГруппаПериодДействияДоговора.Заголовок = "Период действия договора";
	ГруппаПериодДействияДоговора.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаПериодДействияДоговора.ОтображатьЗаголовок = Ложь; 
	ГруппаПериодДействияДоговора.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
	ГруппаПериодДействияДоговора.РастягиватьПоГоризонтали = ИСТИНА;
	
	НачалоДействияДоговора = Элементы.Добавить("ВКМ_НачалоДействияДоговора", Тип("ПолеФормы"), ГруппаПериодДействияДоговора);
	НачалоДействияДоговора.Заголовок = "Начало действия договора";
	НачалоДействияДоговора.Вид = ВидПоляФормы.ПолеВвода;
	НачалоДействияДоговора.ПутьКДанным = "Объект.ВКМ_НачалоДействияДоговора";
	
	КонецДействияДоговора = Элементы.Добавить("ВКМ_КонецДействияДоговора", Тип("ПолеФормы"), ГруппаПериодДействияДоговора);
	КонецДействияДоговора.Заголовок = "Конец действия договора";
	КонецДействияДоговора.Вид = ВидПоляФормы.ПолеВвода;
	КонецДействияДоговора.ПутьКДанным = "Объект.ВКМ_КонецДействияДоговора";
	
	СуммаАбонентскойПлаты = Элементы.Добавить("ВКМ_СуммаАбонентскойПлаты", Тип("ПолеФормы"), ГруппаАбонентскаяПлата);
	СуммаАбонентскойПлаты.Заголовок = "Сумма абонентской платы";
	СуммаАбонентскойПлаты.Вид = ВидПоляФормы.ПолеВвода;
	СуммаАбонентскойПлаты.ПутьКДанным = "Объект.ВКМ_СуммаАбонентскойПлаты";
	
	СтоимостьЧасаРаботы = Элементы.Добавить("ВКМ_СтоимостьЧасаРаботы", Тип("ПолеФормы"), ГруппаАбонентскаяПлата);
	СтоимостьЧасаРаботы.Заголовок = "Стоимость часа работы";
	СтоимостьЧасаРаботы.Вид = ВидПоляФормы.ПолеВвода;
	СтоимостьЧасаРаботы.ПутьКДанным = "Объект.ВКМ_СтоимостьЧасаРаботы";
	
КонецПроцедуры	

#КонецОбласти

