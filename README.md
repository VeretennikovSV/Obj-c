# Objective-c just to be here
___

~~_Данное репо нужно просто для того чтобы ему быть здесь._~~

### Что здесь есть:
- Обычный экран на уровне ДЗшек в твоих любимых курсах. (`ViewController`)
  - Замыкания `completion` и `sumOf` **просто чтобы вспомнить** как их вообще писать.
  - Квардратик UIView.
    - Что-то вроде сервиса для работы с цветом `ViewColorModel`.
  - В нем дефолтные три текстфилда rgb.
    - Экстеншен для них во имя KISS.
  - Меняешь циферку от 0 до 255 меняется с анимацией цвет квардратика.
- Экстеншены для UIView для уменьшения объемов кода и так объемного Obj-c.
- Сервис для запросов на бэк `NetworkServiceImpl`.
  - Для него было бы неплохо писать адаптер, чтобы через дженерики нормально мапить возвращаемые значения. **_Аналог `Decodable` из свифта обнаружен не был_**
- Простенькая ячейка для отображения моковой апишки `MyCell`.
  - Соответственно экран с табличкой с отображением этих ячеечек.
- Экран `BreedDetails` который ~~отображает~~ должен был отображать деталку по ответу с бэка, но что отображать из пяти полей я не придумал, поэтому там просто красивая картинка с котиком которая красивенько зумится при скролле.
___

## Из того, что действительно полезно:

- Мостовые методы работы в Swift с Objective-c кодом. Вспомнил как это работало со времен райфа.
  - В файле `IViewController` метод `func swiftUseObjc()`
- В обратном направлении - работа с Swift кодом в Objective-c
  - В файле `IViewController` метод `func printSomeThings(int: NSInteger, string: NSString)`, с кастомным его описанием для Obj-c скоупа.

> ### Да я готов все переписать туда-сюда и мне это понравится
___
## Обертка над таблицей на Obj-c
### Для чего:

_Чтобы не нужно было каждый раз писать делегат дата сорс, конфиг ячейки при создании таблицы_

### Что может:
_Немного. Дефолтное поведение достаточное для простенькой таблицы без сложной логики работы с секциями:_

- Обработка жеста косания ячейки.
- Установка высоты ячейки: Кастом, Адаптив.
- Настройка в три строчки, не считая создания самих ячеек.

### Из чего состоит:

- `VSDSDataSource` - Датасорс, делегат, логика отображения таблицы тут.
- `VSDSConfigurableCell` - То, от чего создается ячейка, помещаемая в `VSDSDataSource`

### Локига работы:

Отличие в логике в том, что при обычном подходе нам нужно создавать ДС таблицы в каком-либо классе или прямо в контроллере, там регистрировать все ячейки которые могут быть в таблице. Это не сильно сложно, но могут возникать напряги и усложнения при увеличении количества различных ячеек и разной логики в них. 

`VSDS` дает простой способ конфига ячеек, никак не взаимодействуя с `UITableViewDelegate` `UITableViewDataSource`.

### Как настроить:
#### 1. Добавить ДС на экран.
``` Swift
    private lazy var tableView = UITableView()
    private lazy var vsdsDataSource = VSDSDataSource(tableView: tableView)
```
Это вся настройка. Далее только создавать _**правильные**_ ячейки.

#### 2. Описать ячейки.
##### Пример создания ячеек
``` Swift
final class VSDSTestCell: VSDSConfigurableCell<UITableViewCell> {
    func testConfigFunc(string: String) {
        contentView.backgroundColor = .blue
        let label = UILabel()
        label.text = string.appending("\(Int.random(in: 0...9))")
        label.setToEdgesOf(contentView)
        label.font = UIFont.systemFont(ofSize: 25)
    }
}

final class VSDSTestCellTwo: VSDSConfigurableCell<UITableViewCell> {
    func testConfigFunc(color: UIColor, string: String, stringTwo: String) {
        contentView.backgroundColor = color
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.setToEdgesOf(contentView)
        stackView.spacing = 4

        let label1 = UILabel()
        label1.text = string
        label1.font = UIFont.systemFont(ofSize: 25)

        let label2 = UILabel()
        label2.text = stringTwo
        label2.font = UIFont.systemFont(ofSize: 13)

        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }
}
```
Ключевое - наследоваться от `VSDSConfigurableCell<UITableViewCell>`
В этой ячейке уже описана **очистка `contentView` в реюз методе**. Так что это еще дополнительная плюшка, но ничего не мешает расширить.

#### 3. Добавить ячейки в ДС.

##### Есть 4 способа создать вашу ячейку в зависимости от требований:

``` Objective-C

- (instancetype) initWithHeight:(nullable NSNumber *)height andConfigureContext:(void(^)(Object _Nonnull cell))configureContext onDidTap:(void(^)(Object _Nonnull cell))onDidTap;
- (instancetype) initWithHeight:(nullable NSNumber *)height andConfigureContext:(void(^)(Object _Nonnull cell))configureContext;
- (instancetype) initWithConfigureContext:(void(^)(Object _Nonnull cell))configureContext onDidTap:(void(^)(Object _Nonnull cell))onDidTap;
- (instancetype) initWithConfigureContext:(void(^)(Object _Nonnull cell))configureContext;
```

##### 1. Ячейка без кастомной высоты и касания:
``` Swift
let defaultCellWithAutomaticHeightWithoutTap = VSDSTestCellFour { cell in
    guard let cell = cell as? VSDSTestCellFour else { return }
    cell.testConfigFunc(color: .green, string: "Default cell without tap", stringTwo: "DEFAULT??")
}
```
##### 2. Ячейка без кастомной высоты с касанием:
``` Swift
let cellWithoutHeightWithTap = VSDSTestCell {  cell in
    guard let cell = cell as? VSDSTestCell else { return }
    cell.testConfigFunc(string: "Tappable default height  ")
} onDidTap: { cell in
    guard let cell = cell as? VSDSTestCell else { return }
    print(cell.vsdsReuseIdentifier, " has been tapped")
}
```
##### 3. Ячейка с кастомной высотой без касания:
``` Swift
let cellWithoutTapWithCustomHeight = VSDSTestCellTwo(height: 30) { cell in
    guard let cell = cell as? VSDSTestCellTwo else { return }
    cell.testConfigFunc(color: .brown, string: "Custom height no tap", stringTwo: "TAP? NO")
}
```
##### 4. Ячейка с кастомной высотой с касанием:
``` Swift
let cellWithCustomHeightWithTap = VSDSTestCellThree(height: 100) { cell in
    guard let cell = cell as? VSDSTestCellThree else { return }
    cell.testConfigFunc(color: .cyan, string: "Open next Screen", stringTwo: "PLEASE")
} onDidTap: { cell in
    guard let cell = cell as? VSDSTestCellThree else { return }
    print(cell.vsdsReuseIdentifier, " has been tapped")
    let screen = TableViewController()
    self.navigationController?.pushViewController(screen, animated: true)
}
```

#### После инициализации ячеек

``` Swift
vsdsDataSource?.appending([cellWithoutHeightWithTap, cellWithoutTapWithCustomHeight, cellWithCustomHeightWithTap, defaultCellWithAutomaticHeightWithoutTap])
tableView.reloadData()
```
___
# ВСЕ
