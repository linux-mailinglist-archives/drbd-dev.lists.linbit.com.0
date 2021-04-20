Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB70366182
	for <lists+drbd-dev@lfdr.de>; Tue, 20 Apr 2021 23:24:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3E534205C6;
	Tue, 20 Apr 2021 23:23:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 14EC94204A7
	for <drbd-dev@lists.linbit.com>; Tue, 20 Apr 2021 23:23:58 +0200 (CEST)
Received: by mail-pg1-f179.google.com with SMTP id s22so6557528pgk.6
	for <drbd-dev@lists.linbit.com>; Tue, 20 Apr 2021 14:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=glVvR85xdfrE67R3CZjbgLnxmue59x0PtY9S4kH+sec=;
	b=r2gWKL7qzxRD5QAnD4hmvrIzR4IMnDbputgSsVU9mX7I2N/lzAT+uMHlGDBQzk1NFf
	yJ5vt5b8+5BY2SgydAZ86nwTu1dYMkMFGJ93a9STfiIMQHV5kPKIr6JDPzREHeTigwnw
	72Eu3fZO2SWgEo9lOxYUfE+5uK40kA//DRMiv3k3OIHEDn/dCdLetufNccjLPZn+7L3C
	Ft/HQavN299Tfa2ExWAijhQLwRwkk9S5iY9AkGq5QKb3zRwjSyOh9FZyaW6IEdUuGcDX
	5VzQ3L+pZCgtMkk9J0smXpAVh5eNjCJqk9n6lcrLy12qzygqhq3nxyQwLp8ex08s7QD7
	m9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=glVvR85xdfrE67R3CZjbgLnxmue59x0PtY9S4kH+sec=;
	b=olT1c/q2umFp/QunfI/+8YrlfIWFGue/X7eODSe+qdf035A4QDvldw+Cg4aHTycSjo
	TDL/Qq4Bx+M93yi+ddicdNSrrlDof51ArmBLFSxuc/Sz59cgvp8kwp6ajkjZ6BOW4qBG
	wspWppl/460T6oBiHNeYFmdqrJefsr4QcrZdt+dTITFc67NeOy47MBEqLhQxnKGPNWkF
	A5H5EyN1OehHS6Le34HBL7LWsIw18eMzAZNeM9TQf+XAkIzgSXuwCWHS+mfa26XwzTJc
	rmNaVzNFRcxwGKqWgtH8YJ5L6XD781w7XverjitYUmAFYJIK7fBGicJOdA/dxs+YcEG7
	wzIw==
X-Gm-Message-State: AOAM533yOUkZCUhcOyt3sUbZymWKck8dpknco4aU6IVms0ZUAAk1ohdA
	qVc4jL9iqzOMLOSJfM/LQHai5Q==
X-Google-Smtp-Source: ABdhPJz2TSHFrEWzD1FcGQP6T82U0X2bs7+O5FlMOXsznfPp/4/EuhhtJb07WaktlcO+jxEFzhgW3w==
X-Received: by 2002:a63:ed12:: with SMTP id d18mr18929494pgi.20.1618953838079; 
	Tue, 20 Apr 2021 14:23:58 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id d6sm45603pji.43.2021.04.20.14.23.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 20 Apr 2021 14:23:57 -0700 (PDT)
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<44663f18fb12e39c53b0e69039c98505b7c6d5da.1605896059.git.gustavoars@kernel.org>
	<ba77fcbe-8770-d234-509b-7dc5ac079319@embeddedor.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2c942833-ae0f-bda5-b023-e2a1860be50f@kernel.dk>
Date: Tue, 20 Apr 2021 15:23:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ba77fcbe-8770-d234-509b-7dc5ac079319@embeddedor.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 027/141] drbd: Fix fall-through warnings for
	Clang
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 4/20/21 2:25 PM, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this, please?

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
