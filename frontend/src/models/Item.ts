class Item {
    id: number;
    nome: string;
    qtd: number;
    kgl: string;
    desc: string;
    categ: string;
    dueDate: Date;

    constructor(id: number, nome: string, qtd: number, kgl: string, desc: string, categ: string, dueDate) {
        this.id = id;
        this.nome = nome;
        this.qtd = qtd;
        this.kgl = kgl;
        this.desc = desc;
        this.categ = categ;
        this.dueDate;
    }
}
export default Item