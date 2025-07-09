import axios, { AxiosResponse } from "axios";
import { CodeEnum } from "@/types/enums/code";
import toast from "react-hot-toast";

const request = axios.create({
  timeout: 50000,
  headers: { "Content-Type": "application/json;charset=utf-8" },
});

request.interceptors.response.use(
  (response: AxiosResponse) => {
    const { code, message } = response.data;
    if (code === CodeEnum.SUCCESS) {
      return response.data;
    }

    if (response.data instanceof ArrayBuffer || response.data instanceof Blob) {
      return response;
    }

    toast.error(message || "Error");
    if (code === CodeEnum.UNAUTHORIZED) {
      window.location.href = "/sign-in";
    }
    return Promise.reject(new Error(message || "Error"));
  },
  (error: Error) => {
    const message = error.message || "Unknown error";
    toast.error(message);
    return Promise.reject(new Error(message));
  }
);

export default request;
