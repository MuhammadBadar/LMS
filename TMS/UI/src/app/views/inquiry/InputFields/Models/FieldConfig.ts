// export interface Validator {
//   name: string;
//   validator: any;
//   message: string;
// }
export interface FieldConfig {
  label?: string;
  name?: string;
  inputType?: string;
  options?: string[];
  collections?: any;
  type: string;
  value?: any;
 // validations?: Validator[];
}
export interface IFormField {
  label: string;
  fieldName: string;
  fieldType: string;
  fieldValue: string;
  placeholder: string;
 // values: IDropdown[]; // To fill dropdown
}