interface Result<T> {
  code: number;
  message: string;
  data?: T;
}
