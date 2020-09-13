import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GroceryComponent } from './grocery/grocery.component';

import { ToolbarModule } from 'primeng/toolbar';
import { ButtonModule } from 'primeng/button';

@NgModule({
  declarations: [
    AppComponent,
    GroceryComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ToolbarModule,
    ButtonModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
