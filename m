Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFB9D7A30
	for <lists+drbd-dev@lfdr.de>; Mon, 25 Nov 2024 03:49:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1616B420302;
	Mon, 25 Nov 2024 03:49:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B649420109
	for <drbd-dev@lists.linbit.com>; Mon, 25 Nov 2024 03:49:35 +0100 (CET)
Received: by mail-pl1-f169.google.com with SMTP id
	d9443c01a7336-2126408cf31so28955245ad.0
	for <drbd-dev@lists.linbit.com>; Sun, 24 Nov 2024 18:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1732502974; x=1733107774;
	darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=bwYRKpTNXZ0AgTOqs1gS//e1QnOtjbZbYKsvZm7kMzk=;
	b=gGGozY8iJE4Hb30+fqVFu5QydTxIgPA4zc4gpsH3GhAWcxKD30YPMFvVtcZpZs2nTC
	Cq+FpYEujYJN0UCflOPr16PSbrAOBx29pqtEO49LctbxVG32/al0la0BD2bSZRl68sCU
	w75BqaltvtAmhMbFmmPjcOwhZXZ1aco+zRdEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1732502974; x=1733107774;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=bwYRKpTNXZ0AgTOqs1gS//e1QnOtjbZbYKsvZm7kMzk=;
	b=lOx425s6jd6miKvxkEMMZTPEf5Lh2RyH7jPeE5h7ajuacetzVYXycBYJWQtXixGPgJ
	3hQUI3ZK6lkyKNBteAHkoPcL11iM+Bptc2254PktnF1ONT6tsTYSDNvQRBD+EKBodane
	V9FrE+R5Rw4/dKx7gjIGxTesU0jrd5yoSrUOWDikFOSAWzCkX2wJ6PnL7RWcsK5kSTXq
	OtQdfXNpgHELyVhBhOlcP7G1jmbc0qUCbQCTulfgJzJf/qd1XDSdrVhfKCZcFYJ6K0E7
	fCA/Ai4KJSNSF7rxakS713lVkWL8nUUuoTmNMBq14V8onJqSJE0ErQnYeuRt8sgRj6SR
	Z01g==
X-Forwarded-Encrypted: i=1;
	AJvYcCX6VBBoV4eZGYqJfmWdcyYXrAu6iPiAoecgH+JlgcwCtp0TGnqGuABJos9vWffNSik9tFAe1rsnCw==@lists.linbit.com
X-Gm-Message-State: AOJu0Yz38bAlzq+7pn5hPv4GhtCGITDVZbz8ZMl1K+nN2XU4wa/Plxi7
	adu/T/YnBncL8uKMfPrQ1AQQDACcneD5khW2TMKL+HOuUy++UHz7zioBMA9Hcw==
X-Gm-Gg: ASbGncsG34R0oH35kJiY147fz9GTHxV9meizcBU16Sc3XR6Wi6u+SJLs7nL87fd5xbt
	EgzWbdV5Oi05oL/KpaBqY9Sks9/Z0OkopTFF4T7qLLOPu5LtLeHHBEomgGDRps62AmBTfWzC/XH
	lpNIK1bqVNzTCEWrlaTR5zbysk/HYLBB8XpEhSIN+QAtvCpMoYxskSAl+kX/F45RDtLBHpIN9LW
	OlaKb7pOW4kmZOwvsw/4r1UsPMWUyV70DnNDF+xOdqJ5wMcJTH9IQ==
X-Google-Smtp-Source: AGHT+IFVP5SVaL1qF/f5JvchALO9YPXcNoBq6pXemW0DxAs2YPUHfvD451iNdYYTDbidp8QZ53Fd+A==
X-Received: by 2002:a17:902:7241:b0:211:ff1c:e611 with SMTP id
	d9443c01a7336-2129f576484mr125711635ad.30.1732502973648; 
	Sun, 24 Nov 2024 18:49:33 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:4ce7:266f:8012:7e3c])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-2129dc1fa27sm53479635ad.225.2024.11.24.18.49.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2024 18:49:32 -0800 (PST)
Date: Mon, 25 Nov 2024 11:49:27 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Saru2003 <sarvesh20123@gmail.com>
Subject: Re: [PATCH] Corrected the spelling of dictionary in the example
	usage of 'algorithm_params' in the ZRAM documentation.
Message-ID: <20241125024927.GA440697@google.com>
References: <20241124134550.69112-1-sarvesh20123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124134550.69112-1-sarvesh20123@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	terrelln@fb.com, lars.ellenberg@linbit.com,
	senozhatsky@chromium.org, drbd-dev@lists.linbit.com
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

On (24/11/24 19:15), Saru2003 wrote:
> Signed-off-by: Saru2003 <sarvesh20123@gmail.com>

Can you please resend v2 with:
- updated subject "Documentation: zram: fix dictionary spelling"
- perhaps a short commit message is still needed
- I'd also assume your real name should be in SoB

Otherwise looks good.

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
