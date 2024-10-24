Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1284F9AE3F8
	for <lists+drbd-dev@lfdr.de>; Thu, 24 Oct 2024 13:33:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2DA2142035F;
	Thu, 24 Oct 2024 13:33:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 593EF42033E
	for <drbd-dev@lists.linbit.com>; Thu, 24 Oct 2024 13:33:31 +0200 (CEST)
Received: by mail-ej1-f42.google.com with SMTP id
	a640c23a62f3a-a9a6acac4c3so113422366b.0
	for <drbd-dev@lists.linbit.com>; Thu, 24 Oct 2024 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1729769611;
	x=1730374411; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=rWtsrOKCMM7pY97kvZqcmH3W8hVMKlNxVkETJgGfjkc=;
	b=2TqCn/kmL3CiPDfUb1OAEEBshCFwtnIz9o96/OALrATs3zQnNdT2Pug2EIY51doyOY
	RKLBkXq6B08SKu/ukLezLv1M2dIN95TpXOldOm430XCIWi23wnpbDeGbD3ITGdVvhNpj
	GRhZLOWYfE7AuCPAM5/n/djc+WjlPiiKyuzkdhqzk3Y3U8fpGmNsn4n2f71EdSSLq8B0
	+L32oXGpd8u54hNi9tYmxe2edhr0CpuZk3WHn1hgmkvNcc71+8bg6EXWX53JxzZgzMD5
	Iz7uZ7pEReMko3Wdz9sCOncX6URZLROk6UwsifPEjqhyVmqcZDxUhRV5zN2q+Ac2sLA1
	eELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1729769611; x=1730374411;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=rWtsrOKCMM7pY97kvZqcmH3W8hVMKlNxVkETJgGfjkc=;
	b=udcGLPNDfosmUDMdy0bDcTVye+IiuseV51qL4TRW6zMXcgLETr6BGIxJpGhz0mcNU3
	Tlgr9OLho9K50Hrvt0QW8U+ONvxodS1jr+uhtubE+31SHv6ybGMWdvSy0ESy0auTM5SP
	OBd+YR5xPEvRxgBpA9Gtp4x0ZCCVFOR0p/qqIku+88bQ4JH0coy6u/mTaa5c/gF6sE8E
	+mlmJyZ930cEUH0XwQbEJucvwTn50FdRqJ60jb+w6RhdRlWX3+PlxoRFQkeL3UaQMLz5
	Ymfg/aAAn5DxTWINFpQvQGgpvcnbJMJ7jD4+l39lkl8EAWLQqehpK+iC4XBq+1pJtyag
	pcaA==
X-Gm-Message-State: AOJu0YxEfCvG7QOS8UVN5MCREuL2nU3B16GUlcEck4/+NwiKq3EAJw3K
	LdhGQiigmMZCKI0CPuaB9NcHGnE+pHmm3oz/JWQE5rvt4rFCt441tVuNVeW3id7sSZlnmMm4nBV
	K5eKMCFhcXS9+/0Z/I4+W8rSIo+CrIKQoZMxCQoC7ZftpjG9D84kO7A==
X-Google-Smtp-Source: AGHT+IF1SQEfXOhDau3N3pi7on4eHN3UOlSYgP6jXZDmMNrBOYLUY6e2byeU/+hoHZjpSoxEMTlve6iQvx0o+kfTkWA=
X-Received: by 2002:a17:907:3d91:b0:a99:e4a2:1cda with SMTP id
	a640c23a62f3a-a9ad285ee55mr146540866b.56.1729769611350; Thu, 24 Oct 2024
	04:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241022114151.8050-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20241022114151.8050-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 24 Oct 2024 13:33:20 +0200
Message-ID: <CAGNP_+WTu+xCHWZ6Fou8uqCYFauvqTK3Ch8rT-3YhZnrD0Mf5g@mail.gmail.com>
Subject: Re: [PATCH] drbd: Fix seq_num numeric conversion error
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

> seq_num is a 32-bit value and should not be converted with be64_to_cpu().

Thanks. Applied as:
https://github.com/LINBIT/drbd/commit/168bcdd0a56ca80fed4ca9e05589c1188b2aa589

The commit will be merged to master in due course.

Best regards,
Joel
