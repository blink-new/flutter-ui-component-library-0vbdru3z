import React, { useState } from 'react';

interface FlutterTextFieldProps {
  label?: string;
  placeholder?: string;
  value?: string;
  onChange?: (value: string) => void;
  type?: 'text' | 'email' | 'password' | 'number';
  disabled?: boolean;
  error?: string;
  helperText?: string;
  multiline?: boolean;
  rows?: number;
  className?: string;
}

export const FlutterTextField: React.FC<FlutterTextFieldProps> = ({
  label,
  placeholder,
  value,
  onChange,
  type = 'text',
  disabled = false,
  error,
  helperText,
  multiline = false,
  rows = 3,
  className = ''
}) => {
  const [isFocused, setIsFocused] = useState(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    onChange?.(e.target.value);
  };

  const baseClasses = `
    w-full px-4 py-3 rounded-lg border-2 transition-all duration-200
    bg-white text-gray-900 placeholder-gray-500
    focus:outline-none
    ${isFocused || value ? 'border-orange-400' : 'border-gray-200'}
    ${error ? 'border-red-500' : ''}
    ${disabled ? 'bg-gray-50 cursor-not-allowed' : 'hover:border-gray-300'}
  `;

  const InputComponent = multiline ? 'textarea' : 'input';

  return (
    <div className={`space-y-2 ${className}`}>
      {label && (
        <label className="block text-sm font-medium text-gray-700">
          {label}
        </label>
      )}
      
      <div className="relative">
        <InputComponent
          type={multiline ? undefined : type}
          placeholder={placeholder}
          value={value}
          onChange={handleChange}
          onFocus={() => setIsFocused(true)}
          onBlur={() => setIsFocused(false)}
          disabled={disabled}
          rows={multiline ? rows : undefined}
          className={baseClasses}
        />
        
        {isFocused && (
          <div className="absolute inset-0 rounded-lg border-2 border-orange-400 pointer-events-none animate-pulse" />
        )}
      </div>
      
      {(error || helperText) && (
        <p className={`text-sm ${error ? 'text-red-500' : 'text-gray-600'}`}>
          {error || helperText}
        </p>
      )}
    </div>
  );
};