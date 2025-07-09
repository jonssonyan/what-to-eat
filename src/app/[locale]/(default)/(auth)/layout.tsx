import { AppContextProvider } from "@/contexts/app";
import React from "react";

const AuthLayout = ({ children }: { children: React.ReactNode }) => {
  return <AppContextProvider>{children}</AppContextProvider>;
};

export default AuthLayout;
