class Item {
    id: number;
    nome: string;
    qtd: number;
    kgl: string;
    desc: string;
    categ: string;
    dataVal: number;

    constructor(id: number, nome: string, qtd: number, kgl: string, desc: string, categ: string, dataVal: number) {
        this.id = id;
        this.nome = nome;
        this.qtd = qtd;
        this.kgl = kgl;
        this.desc = desc;
        this.categ = categ;
        this.dataVal = dataVal;
    }
}
export default Item