import { Component, OnInit } from '@angular/core';
import { Product } from '../shared/model';

@Component({
  selector: 'app-grocery',
  templateUrl: './grocery.component.html',
  styleUrls: ['./grocery.component.scss']
})
export class GroceryComponent implements OnInit {

  products: Product[] = [{ name: "Oranges", votes: 0 }, { name: "Bananas", votes: 0 }];

  thumbsUp(i) {
    this.products[i].votes += 1
  }

  thumbsDown(i) {
    this.products[i].votes -= 1
  }

  ngOnInit() {

  }

}
