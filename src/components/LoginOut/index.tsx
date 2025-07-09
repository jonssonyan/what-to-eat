interface Props {
  open: boolean;
  onClose: () => void;
  onConfirm: () => void;
}

const LoginOutFC = ({ open, onClose, onConfirm }: Props) => {
  if (!open) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30 backdrop-blur-sm">
      <div className="bg-white rounded-2xl p-6 shadow-xl w-80">
        <h2 className="text-lg font-semibold text-emerald-800 mb-4">确认退出</h2>
        <p className="text-sm text-gray-600 mb-6">你确定要退出登录吗？</p>
        <div className="flex justify-end space-x-3">
          <button
            onClick={onClose}
            className="px-4 py-2 rounded-xl text-gray-500 hover:bg-gray-100 transition"
          >
            取消
          </button>
          <button
            onClick={onConfirm}
            className="px-4 py-2 bg-emerald-600 text-white rounded-xl hover:bg-emerald-700 transition"
          >
            确认退出
          </button>
        </div>
      </div>
    </div>
  );
};

export default LoginOutFC;
