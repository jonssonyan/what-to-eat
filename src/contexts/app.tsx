"use client";

import { ContextProviderProps, ContextProviderValue } from "@/types/context";
import { createContext, useContext, useEffect, useState } from "react";

import { AccountInfo } from "@/types/account";
import request from "@/utils/axios";

const AppContext = createContext({} as ContextProviderValue);

export const AppContextProvider = ({ children }: ContextProviderProps) => {
  const [accountInfo, setAccountInfo] = useState<AccountInfo | null>(null);

  const fetchAccountInfo = async () => {
    try {
      const { data } = await request({
        url: "/api/get-account-info",
        method: "post",
      });
      setAccountInfo(data);
    } catch (e) {
      console.error(`get account info failed: ${e}`);
    }
  };

  useEffect(() => {
    fetchAccountInfo();
  }, []);

  return (
    <AppContext.Provider value={{ accountInfo, setAccountInfo }}>{children}</AppContext.Provider>
  );
};

export const useAppContext = () => useContext(AppContext);