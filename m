Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C48B2498D
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Aug 2025 14:32:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3352E1626A6;
	Wed, 13 Aug 2025 14:32:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E92371608F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 14:32:19 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id
	98e67ed59e1d1-32129c4e9a4so5283818a91.1
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1755088339;
	x=1755693139; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=BNG3CwDZnVq+LlYCqJlDgz0JDJC7ub+N0Uk1MeSzHuI=;
	b=qP6FCjsc/aNKIEIFh9qzKip8mj3bhqRePHv3sRiFpySmDZEXYegqzDW2KhI7Pa4Ek8
	vEAVctukxpQVfShOeiIr0CktQ21A62Xj03xJsK80S/8irR5oyS4oEeaiYf4QLstXWBvL
	MUGNG14o65oMfFhhWTMwEykHspT9QKf+XXFCxV4JBuFphLWOWx92tvb1ttrk4uiKhpoO
	fD3f+ysAlKuwW/Hlwo9hSNelHIMnZhKMgysuFeEkPj8o4piX2VyWxKOFqsfbFZBb51tj
	deYZbpd2bLLpBQgaFI+sTU74AW+4mqjcN+kVNzJnIiVEwXyF0qE8DCOqkg5cd6aK8WWq
	WzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1755088339; x=1755693139;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=BNG3CwDZnVq+LlYCqJlDgz0JDJC7ub+N0Uk1MeSzHuI=;
	b=G2XJvCKSf6+tfFRxlMQYwy0TCk9Q32Am4Ga+h/FqrkgHhO5KUli0rLVrDUEUSUC6Mg
	KgqSAqOw0pNXnONUfEXwHXQjowYNAoo9r1m+MVZoul5y4vAMo9fSnOT08Y+UR/6zH2Un
	r5EzUM6kdWG1R+vYAN2WoduxQy8bChs5Hict666yqu+fRqMECK6yExl8Q0Al8QBw858u
	uwMT/7JtwZC495HTpJDk+nktGjcVUBmKyUBNpWlfkZpnPQr5Myv5+aqCLjrC5QFcKsR1
	4QJlgo6lO9j1yVpI8NiIEhtrRW8LVC2RvxDKWKA/dp8X8bLJLfi9HwFd48edGwOktcPD
	pMIw==
X-Forwarded-Encrypted: i=1;
	AJvYcCX/gD0Yp0YwzBF0k3ymiyT27p2jlZh0bYFqUmkPwmvKU1XkaBzR0CGfyN3lNFqlM0Zc+xRhk1guvQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YysNPTB69y8czlduOt6ZFugxxjkCUQMhzvqhKVzKuZy6NrBzHD+
	OteIMPTH4ilu/r5nHkiFNUaJE5t0zhshICsDclIdC9mrnwvAjiYPVNK6wu6VcCCnf47sYGVfqE+
	TXy7b
X-Gm-Gg: ASbGncsutWg16dMXFTi4YYs92SagafrVvVU3G1gqYz82e8ntslMZ3fljO90rxfNx4mt
	4ouELIHL5eJE5XmiBTmRdQ7cnCFWTjCmLGUlMpTXHnjOUAOnB1Oe/SFaDGeLvMf+jSD9/nkqJPQ
	A2CExrmdDpsehWIqfrLskysu4ng/1A4Grj8qGxOGUH2KBEjkvxiB3nw8ONOgB+8brO+6oBJwUCr
	zWBEqubdkfuDAptWbl0DtfnCokAPTUN0sZKsK03DjUyhQodA8nc78mkjcAqHL0WeviLZ8tWjVZ3
	pH4DHLk3yK1Iqlpg1OXL/EimNx94XsDIOZaKF3/dVXo9JNMZ1zdhpltgembRp6d0ab6zxi70qdE
	ZDhTiFZt98koH7FA=
X-Google-Smtp-Source: AGHT+IH45G27XmEuq78X8gxw6G2P5IIWEUKaJJDkJWCvlT9IOAHkUHlLvMF5cfFKCUbmxNPSZShPMA==
X-Received: by 2002:a17:90b:5211:b0:31e:fe18:c6df with SMTP id
	98e67ed59e1d1-321d0e5cdc3mr4379625a91.16.1755088338731; 
	Wed, 13 Aug 2025 05:32:18 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-3232553e4a2sm82418a91.4.2025.08.13.05.32.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Aug 2025 05:32:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <dlemoal@kernel.org>, 
	Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Jonathan Corbet <corbet@lwn.net>, Erick Karanja <karanja99erick@gmail.com>
In-Reply-To: <20250813071837.668613-1-karanja99erick@gmail.com>
References: <20250813071837.668613-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] Docs: admin-guide: Correct spelling mistake
Message-Id: <175508833758.953995.10420055026430792302.b4-ty@kernel.dk>
Date: Wed, 13 Aug 2025 06:32:17 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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


On Wed, 13 Aug 2025 10:18:36 +0300, Erick Karanja wrote:
> Fix spelling mistake directoy to directory
> 
> Reported-by: codespell
> 
> 

Applied, thanks!

[1/1] Docs: admin-guide: Correct spelling mistake
      commit: f7a2e1c08727384cde1c686dd57172f99b5f2e6e

Best regards,
-- 
Jens Axboe



