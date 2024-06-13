Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C29076BA
	for <lists+drbd-dev@lfdr.de>; Thu, 13 Jun 2024 17:31:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1C6C142081C;
	Thu, 13 Jun 2024 17:31:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B2BE4207DE
	for <drbd-dev@lists.linbit.com>; Thu, 13 Jun 2024 17:31:47 +0200 (CEST)
Received: by mail-ed1-f50.google.com with SMTP id
	4fb4d7f45d1cf-57a1fe6392eso1569011a12.0
	for <drbd-dev@lists.linbit.com>; Thu, 13 Jun 2024 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1718292707;
	x=1718897507; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=vqKLhNf1aFLb6Gh4QQa2fffuri4uF0N129PwRRprJCA=;
	b=ZXPEvL76NCEMH6qvkgmMJesG3NqMUAtKRv8irIqS9j0sMzlbUHkXlOvFPT63PUzVa9
	QXMcB2JRHTb9ZCGbUzY/WSowbJMwLyHnnj0Ua0u+hNe0wV8rIhw+924p+x2VEbe8h+sr
	jtjZS7VCj2C2QkPA73r16AMhVbzPXn7S235/cCAiV2CkxsHe+XkcoSQnDrsvKvYCiTYp
	CeiLvfJqFiBO+eKh9hFMdXie7oyds5VcvpIHqIJ2+bOyWvviHpCc5FBrhrM81eNycmGQ
	OSMz7lthrT5v8YtN1bcxm/TO2LUU+lGfRC4aijNcRjHWcctbY0+ODGcweIITOzRVd8BC
	jD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1718292707; x=1718897507;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=vqKLhNf1aFLb6Gh4QQa2fffuri4uF0N129PwRRprJCA=;
	b=nb1gv4cgTMqX/RB+wUH6Zh0JQX1D+aI93QCwLowfutVlYndWmp5OWKxAYpQE9Vnnwj
	pwBqP0NhtOkA6iLMoj+9kvo6/FQNM6Fl4bfozdXRKY5j4a/IRovI33i/PMhoBLFquD4X
	L0LU0nENGqM/57r5VcEUxPfh/L6mDeYmpDT9Za1yVmpw1jvqRl1/mtzIUZzLno//IBke
	NT4OHjsntrJuxBdsbeu1dPd98cr6veSxHT/qTVYbUsSVR+Vffa4B1AFqfq2hMn4zPChC
	dScCQq0Ze8GiVq+z6KSrktBYFioo6Vwmg+QckNBuESQ7x6SnYHBmBnU700bXaKTJmJre
	ANsw==
X-Gm-Message-State: AOJu0Yw7cJovV/Fhf4n14/p9DEl0aCj6hfwGfkcVwi5XKsTud+K7SHDJ
	pYyi7hwPvTDydDep5z364GD1fJIp5OJvuCHEVJMbtWyXA3XGQdAh2C3zkOFu03qlp6uS+/7jGPq
	d9lwtLSH5wSnGh1J6aOdUAGkXcvgfKRHjNirZbdOcSDpNa/k6nSJcCA==
X-Google-Smtp-Source: AGHT+IHyHB4YDupTSCxepHDEsODkrRK5I6FeP4FU0nQKnSCjjzM7t91TelwaBwzZe0kykcwwSt0oG+FN/Lndbx5QugM=
X-Received: by 2002:a50:a694:0:b0:57a:4c9b:5dbc with SMTP id
	4fb4d7f45d1cf-57cbd69eba3mr96920a12.16.1718292707173; Thu, 13 Jun 2024
	08:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240611111406.8308-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20240611111406.8308-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 13 Jun 2024 17:31:35 +0200
Message-ID: <CAGNP_+XpeynrNvTA=tpRWECfmZK1SJersc21Gv-Qu6-suRoNUw@mail.gmail.com>
Subject: Re: [PATCH] rdma: Fix dtr_path use-after-free
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Cc: drbd-dev@lists.linbit.com
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Thanks. Merged as
https://github.com/LINBIT/drbd/commit/d37efcdbae279f124aa2271bbd8927058a6fb038

I edited the commit message a bit to make it easier to understand.

Best regards,
Joel
