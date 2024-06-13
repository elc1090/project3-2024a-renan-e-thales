import Item from './Item'

const Items: Item[] = [
    new Item(0, 'Garrafa de água', 26, '500ml', 'sem descrição', 'suprimento', Date.parse('10-10-10:01:02')),
    new Item(1, 'Pacote de sal', 128, '1Kg', 'pacote de sal', 'suprimento', Date.parse('10-10-10:01:02')),
    new Item(2, 'Pacote de arroz', 256, '2Kg', 'pacote de arroz', 'suprimento', Date.parse('10-10-10:01:02')),
]

export default Items