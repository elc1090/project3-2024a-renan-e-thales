class Item {
  id: number;
  nome: string;
  qtd: number;
  kgl: string;
  desc: string;
  categ: string;
  dataVal: Date;
  isOpen: boolean = false;

  private static lastId: number = 0;

  toggleOpen() {
    this.isOpen = !this.isOpen;
  }

  constructor(
    nome: string,
    qtd: number,
    kgl: string,
    desc: string,
    categ: string,
    dataVal: Date | string,
  ) {
    this.id = ++Item.lastId;

    this.nome = nome;
    this.qtd = qtd;
    this.kgl = kgl;
    this.desc = desc;
    this.categ = categ;
    if (typeof dataVal === "string") {
      this.dataVal = new Date(dataVal);
    } else {
      this.dataVal = dataVal;
    }
  }
}

export default Item;
